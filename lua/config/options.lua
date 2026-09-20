vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_recommended_style = 0

local o = vim.o
o.termguicolors = true
o.mouse = "a"
o.mousemoveevent = true
o.clipboard = "unnamedplus"
o.undofile = true
o.swapfile = false
o.backup = false
o.updatetime = 200
o.timeoutlen = 300
o.ttimeoutlen = 10
o.splitright = true
o.splitbelow = true
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 6
o.sidescrolloff = 8
o.wrap = false
o.linebreak = true
o.breakindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true
o.list = true
o.listchars = "tab:▸ ,trail:·,nbsp:␣,extends:»,precedes:«"
o.fillchars = "eob: ,fold: ,foldopen:▾,foldclose:▸,foldsep: "
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.smoothscroll = true
o.winborder = "rounded"
o.winminwidth = 8
o.confirm = true
o.exrc = true
o.pumheight = 12
o.pumblend = 8
o.winblend = 0
o.showmode = false
o.laststatus = 3
o.cmdheight = 1
o.completeopt = "menu,menuone,noselect,fuzzy,nosort,popup"
o.wildmode = "longest:full,full"
o.grepprg = "rg --vimgrep --smart-case --hidden --glob !.git"
o.grepformat = "%f:%l:%c:%m"

vim.opt.shortmess:append("IWcC")
vim.opt.diffopt:append("linematch:60,algorithm:histogram")
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  underline = true,
  float = { border = "rounded", source = true, header = "", prefix = "" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
  virtual_text = { current_line = true, spacing = 2, source = "if_many" },
})
