return {
  {
    "kpankonen/vim-code-dark",
    branch = "colors",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme "codedark"
    end,
  },
}
