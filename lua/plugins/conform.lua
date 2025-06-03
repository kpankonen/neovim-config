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
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          bash = { "shfmt" },
          go = { "gofmt" },
          json = { "jq" },
          lua = { "stylua" },
          packer = { "packer_fmt" },
          python = { "ruff_format" },
          sh = { "shfmt" },
          terraform = { "terraform_fmt" },
          tofu = {"tofu_fmt" },
        },
        formatters = {
          shfmt = {
            prepend_args = { "-i", "2", "-sr", "-ci" },
          },
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
        },
      })

      -- Set up format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.tf",
        callback = function()
          require("conform").format({ async = false })
        end,
      })
    end,
  },
}
