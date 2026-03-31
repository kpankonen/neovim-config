return {
  {
    "vim-airline/vim-airline",
    cond = not vim.g.vscode,

    config = function()
      vim.g["airline_theme"] = "codedark"
      vim.g["airline#extensions#ale#enabled"] = 1
      vim.g["airline_powerline_fonts"] = 1
      vim.g["airline#extensions#tabline#formatter"] = "default"
    end,
  },
}
