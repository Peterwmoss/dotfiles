local home = os.getenv("HOME")
dofile(home .. "/.config/conky/config.lua")

local text = [[
 + C: Show help
]]

conky.text = text
