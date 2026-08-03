hl.on("hyprland.start", function ()
  -- Background Services & Core Apps
  hl.exec_cmd("hyprlauncher --help > /dev/null")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("steam")
  hl.exec_cmd("discord")

  -- EWW Status Bar Setup
  hl.exec_cmd("killall eww 2>/dev/null")
  hl.exec_cmd("eww daemon")

  -- Short delay to allow daemon & monitors to initialize
  hl.exec_cmd("sleep 0.5")

  -- Query active monitors and spawn individual bar instances
  local handle = io.popen("hyprctl monitors -j")
  local json_text = handle:read("*a")
  handle:close()

  local mon_count = 0
  for _ in json_text:gmatch('"id":') do
    mon_count = mon_count + 1
  end

  if mon_count > 0 then
    for i = 0, mon_count - 1 do
      hl.exec_cmd(string.format("eww open bar --id bar_%d --screen %d", i, i))
    end
  else
    hl.exec_cmd("eww open bar --id bar_0 --screen 0")
  end
end)