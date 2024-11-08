return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        packer = { "packer_fmt" },
        python = { "ruff_format" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-sr", "-ci" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    },
  },
}
