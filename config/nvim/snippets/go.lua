local function fn()
  return {
    t("func "),
    i(3),
    t("("),
    i(2),
    t(") "),
    i(1),
    t(" {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }
end

local function st()
  return {
    t("type "),
    i(1),
    t(" struct {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }
end

return {
  s("func", fn()),
  s("fn", fn()),
  s("struct", st()),
  s("sc", st()),
}
