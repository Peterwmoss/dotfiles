local util = require 'peterwmoss.snippet_util'

local function class_name()
  local class = vim.fn.expand("%:t:r")
  return class
end

local function package_name()
  local path = vim.fn.expand("%:h")
  path = path:gsub(".*java/", "")
  path = path:gsub(".*groovy/", "")
  path = path:gsub("/", ".")
  return path
end

local function class()
  return {
    t("public class "),
    f(class_name),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }
end

local function package()
  return {
    t("package "),
    f(package_name),
    t(";"),
    t({ "", "" }),
    t({ "", "" }),
  }
end

local function test()
  return {
    t("@Test"),
    f(function()
      local filter = function(action)
        return action.kind == 'source'
      end
      vim.lsp.buf.code_action({}, filter, true)
      return ''
    end),
    t({ "", "void test_" }),
    i(1),
    t("() {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }
end

local function sout()
  return {
    t("System.out.println("),
    i(0),
    t(");"),
  }
end

local function new_file()
  return util.concat(package(), class())
end

return {
  s("class", class()),
  s("package", package()),
  s("pc", new_file()),
  s("test", test()),
  s("sout", sout()),
}
