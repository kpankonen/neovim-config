return {
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = not vim.g.vscode,
    main = "ibl",
    opts = {
      enabled = false,
    },
    config = function()
      vim.keymap.set("n", "<Leader>i", "<cmd>IBLToggle<cr>", key_opts)
    end,
  },
}
