return {
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local languages = { "bash", "python", "vim" }
      local treesitter = require("nvim-treesitter")

      treesitter.setup()

      local installed = treesitter.get_installed("parsers")
      local missing = vim.tbl_filter(function(language)
        return not vim.tbl_contains(installed, language)
      end, languages)

      if #missing > 0 then
        treesitter.install(missing)
      end

      -- Highlighting is opt-in per buffer; there is no global enable.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
