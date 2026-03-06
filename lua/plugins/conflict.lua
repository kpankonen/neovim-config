return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      vim.api.nvim_set_hl(0, "ConflictOurs", { bg = "#2a3a2a" })

      require("git-conflict").setup({
        highlights = {
          current = "ConflictOurs",
          incoming = "DiffAdd",
        },
      })
    end,
  },
}
