return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    cond = not vim.g.vscode,
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
