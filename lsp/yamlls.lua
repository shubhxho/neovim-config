return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = (function()
        local ok, store = pcall(require, "schemastore")
        if ok then
          return store.yaml.schemas()
        end
        return {}
      end)(),
    },
  },
}
