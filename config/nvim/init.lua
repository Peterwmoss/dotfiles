local modules = {
  require("peterwmoss.plugin"),
  require("peterwmoss.remap"),
}

for _, module in ipairs(modules) do
  module.setup()
end

require("peterwmoss")
