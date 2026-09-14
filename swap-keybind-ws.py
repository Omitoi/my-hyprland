#!/usr/bin/env python3
import sys, json, subprocess

ws = int(sys.argv[1]) if len(sys.argv) > 1 else 1

try:
    cx, cy = map(int, subprocess.check_output(["hyprctl", "cursorpos"], text=True).strip().split(","))
    mons = json.loads(subprocess.check_output(["hyprctl", "monitors", "-j"], text=True))
    
    # Identify active monitor under cursor, fallback to focused monitor
    m = next((mon for mon in mons if mon["x"] <= cx < mon["x"] + mon["width"] and mon["y"] <= cy < mon["y"] + mon["height"]), None)
    if not m:
        m = next((mon for mon in mons if mon.get("focused")), mons[0])
    
    current_mon_id = m["id"]
    current_ws_id = m["activeWorkspace"]["id"]

    if ws == current_ws_id:
        sys.exit(0)

    wss = json.loads(subprocess.check_output(["hyprctl", "workspaces", "-j"], text=True))
    target_ws = next((w for w in wss if w["id"] == ws), None)
    other_mon = next((mon for mon in mons if mon["id"] != current_mon_id and mon["activeWorkspace"]["id"] == ws), None)

    if other_mon:
        # Only swap if the requested workspace is actively displayed on the other monitor
        other_mon_id = other_mon["id"]
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{ws}', monitor = {current_mon_id} }}))"])
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{current_ws_id}', monitor = {other_mon_id} }}))"])
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.focus({{ workspace = '{ws}' }}))"])
    else:
        # Otherwise, switch only the current monitor; leave other monitor untouched
        if target_ws and target_ws["monitorID"] != current_mon_id:
            subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{ws}', monitor = {current_mon_id} }}))"])
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.focus({{ workspace = '{ws}' }}))"])

    # Keep cursor on the current screen
    subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.cursor.move({{ x = {cx}, y = {cy} }}))"])
except Exception:
    pass
