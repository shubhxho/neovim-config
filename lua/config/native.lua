-- Neovim 0.12 builtins. No extra plugins.

pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")

pcall(vim.lsp.on_type_formatting.enable, true)
pcall(vim.lsp.inline_completion.enable, true)
pcall(vim.lsp.linked_editing_range.enable, true)
pcall(function()
  vim.lsp.document_color.enable(true)
end)

vim.keymap.set("n", "<leader>uu", "<cmd>Undotree<cr>", { desc = "Undotree" })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffTool<cr>", { desc = "DiffTool" })
vim.keymap.set("n", "<leader>cW", function()
  vim.lsp.buf.workspace_diagnostics()
end, { desc = "Workspace diagnostics" })
vim.keymap.set("i", "<C-l>", function()
  if vim.lsp.inline_completion.get() then
    return
  end
  return "<C-l>"
end, { expr = true, replace_keycodes = true, desc = "Accept inline completion" })
vim.keymap.set("i", "<M-]>", function()
  pcall(vim.lsp.inline_completion.select, { count = 1 })
end, { desc = "Next inline completion" })
vim.keymap.set("i", "<M-[>", function()
  pcall(vim.lsp.inline_completion.select, { count = -1 })
end, { desc = "Prev inline completion" })
