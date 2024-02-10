local function concat(list1, list2)
  local list = {}

  for k,v in ipairs(list1) do
    table.insert(list, v)
  end

  for k,v in ipairs(list2) do
    table.insert(list, v)
  end

  return list
end

local function class_name()
  return vim.fn.expand("%:t:r")
end

local function package_name()
  local path = vim.fn.expand("%:h")
  path = path:gsub(".*java/", "")
  path = path:gsub(".*groovy/", "")
  path = path:gsub("/", ".")
  return path
end

local class = {
  t("public class "),
  f(class_name, {}),
  t(" {"),
  t({ "", "\t" }),
  i(0),
  t({ "", "}" }),
}

local package = {
  t("package "),
  f(package_name, {}),
  t(";"),
  t({ "", "" }),
  t({ "", "" }),
}

local test = {
  t("@Test"),
  t({ "", "void test_" }),
  i(1),
  t("() {"),
  t({ "", "\t" }),
  i(0),
  t({ "", "}" }),
}

local new_file = concat(package, class)

return {
  s("class", class),
  s("package", package),
  s("pc", new_file),
  s("test", test),
}
