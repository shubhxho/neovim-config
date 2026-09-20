return {
  settings = {
    json = {
      validate = { enable = true },
      schemas = (function()
        local ok, store = pcall(require, "schemastore")
        if ok then
          return store.json.schemas()
        end
        return {}
      end)(),
    },
  },
}
