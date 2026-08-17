#!/usr/bin/env python3
import sys, json, subprocess

ws = int(sys.argv[1]) if len(sys.argv) > 1 else 1

try:
    cx, cy = map(int, subprocess.check_output(["hyprctl", "cursorpos"], text=True).strip().split(","))
    mons = json.loads(subprocess.check_output(["hyprctl", "monitors", "-j"], text=True))
    m = next((m for m in mons if m["x"] <= cx < m["x"] + m["width"] and m["y"] <= cy < m["y"] + m["height"]), mons[0])
    
    wss = json.loads(subprocess.check_output(["hyprctl", "workspaces", "-j"], text=True))
    target = next((w for w in wss if w["id"] == ws), None)
    
    if target and target["monitorID"] != m["id"]:
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{ws}', monitor = {m['id']} }}))"])
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{m['activeWorkspace']['id']}', monitor = {target['monitorID']} }}))"])
    else:
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.focus({{ workspace = '{ws}' }}))"])
        subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.workspace.move({{ workspace = '{ws}', monitor = {m['id']} }}))"])
        
    subprocess.run(["hyprctl", "eval", f"hl.dispatch(hl.dsp.cursor.move({{ x = {cx}, y = {cy} }}))"])
except Exception:
    pass
