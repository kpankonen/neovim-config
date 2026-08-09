return {
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = not vim.g.vscode,
    opts = {
      enabled = false,
    },
    config = function(_, opts)
      require("ibl").setup(opts)

      vim.keymap.set("n", "<Leader>i", "<cmd>IBLToggle<cr>", require("keyopts"))
    end,
  },
}
