if vim.fn.has("nvim-0.12") == 0 then
  vim.notify("This config needs Neovim 0.12+ (you have " .. vim.version().major .. "." .. vim.version().minor .. ")", vim.log.levels.ERROR)
  return
end

require("config")
