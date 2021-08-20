local home = os.getenv("HOME")
dofile(home .. "/.config/conky/config.lua")

local text = [[
${alignc}System

 + וּ + E: Log out
 + D: Open Programs
 + P: Power Menu (Shutdown / Reboot)
 + C: Hide this menu

${alignc}Screenshots

 + S: Screenshot (Select  Choose)
 + וּ + S: Screenshot (Select  ~/Pictures)
 + PrtSc: Screenshot (Whole screen  ~/Pictures)

${alignc}Volume and brightness

 + ﱛ : Volume up
 + ﱜ : Volume down
 +  + : Brightness up
 +  - : Brightness down

${alignc}Window Manager (master = left window)

 +  : New terminal
 + Q : Quit current window
 + J : Focus next window
 + K : Focus previous window
 + H : Smaller master
 + L : Bigger master
 + [1-4]: Switch workspace
 + וּ + [1-4]: Move focused window to workspace
 + וּ +  : Set focused window as master
]]

conky.text = text
