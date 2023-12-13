local modules = {
  require("peterwmoss.remap"),
  require("peterwmoss.plugin"),
}

for _, module in pairs(modules) do
  module.setup()
end

require("peterwmoss")
