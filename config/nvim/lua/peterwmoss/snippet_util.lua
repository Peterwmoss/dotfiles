local function concat(list1, list2)
  local list = {}

  for _, v in ipairs(list1) do
    table.insert(list, v)
  end

  for _, v in ipairs(list2) do
    table.insert(list, v)
  end

  return list
end

return {
  concat = concat,
}
