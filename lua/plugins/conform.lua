return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback"
 }
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-sr", "-ci" },
        },
      },
    },
  },
}
