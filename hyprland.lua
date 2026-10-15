-------------------------
---- Hyprland Config ----
-------------------------
-- 1. Dynamic Host Configuration (hosts/<hostname>.lua)
local raw_hostname = io.popen("uname -n"):read("*l") or "default"
local hostname = string.lower(raw_hostname:gsub("%s+", ""))
local ok, _ = pcall(require, "hosts." .. hostname)
if not ok then
    pcall(require, "hosts.default")
end

-- 2. Core Shared Modules
require("myEnv")
require("autoStart")
require("myStyles")
require("myInput")
require("myMisc")
require("myRules")
require("myKeybinds")