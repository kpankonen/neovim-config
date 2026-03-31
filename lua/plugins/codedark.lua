return {
  {
    "kpankonen/vim-code-dark",
    branch = "colors",
    priority = 1000,
    cond = not vim.g.vscode,
    init = function()
      vim.cmd.colorscheme("codedark")
    end,
  },
}
