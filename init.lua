-- https://neovim.io/doc/user/options.html
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false

vim.opt.backupdir = vim.fn.expand("~") .. "/.config/nvim/tmp,/tmp"
vim.opt.directory = vim.fn.expand("~") .. "/.config/nvim/tmp,/tmp"

vim.opt.backspace = "indent,eol,start"
vim.opt.cursorline = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.foldmethod = "syntax"
vim.opt.hlsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.mouse = ""
vim.opt.number = false
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.timeoutlen = 600
vim.opt.title = true
vim.opt.undofile = false
vim.opt.updatetime = 250

vim.cmd("au BufRead,BufNewFile *.service set filetype=systemd")
vim.cmd("au BufRead,BufNewFile *.sls set filetype=sls.yaml")
vim.cmd("au FileType bash,sh setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType dockerfile setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType json setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType lua setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType markdown setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType perl setlocal shiftwidth=4 tabstop=4 expandtab")
vim.cmd("au FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4 expandtab")
vim.cmd("au FileType ruby,eruby setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType sshconfig setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType tcl setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("au FileType terraform setlocal shiftwidth=2 tabstop=2 expandtab commentstring=#\\ %s")
vim.cmd("au FileType xml setlocal shiftwidth=4 tabstop=4 expandtab")
vim.cmd("au FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab")

local key_opts = { silent = true, noremap = true }

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", key_opts)
vim.keymap.set("n", "<CR>", "<cmd>nohlsearch<CR>", key_opts)
vim.keymap.set("n", "<F2>", "<cmd>set paste!<cr>", key_opts)
vim.keymap.set("v", "<", "<gv", key_opts)
vim.keymap.set("v", ">", ">gv", key_opts)
vim.keymap.set("n", "<", "<<", key_opts)
vim.keymap.set("n", ">", ">>", key_opts)
vim.keymap.set("n", "<Tab>", ">>_", key_opts)
vim.keymap.set("n", "<S-Tab>", "<<_", key_opts)
vim.keymap.set("i", "<S-Tab>", "<C-D>", key_opts)
vim.keymap.set("v", "<Tab>", ">gv", key_opts)
vim.keymap.set("v", "<S-Tab>", "<gv", key_opts)

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 1500 })
  end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- find plugin configs in lua/plugins
  { import = "plugins" },
})

-- vim: ts=2 sts=2 sw=2 et
