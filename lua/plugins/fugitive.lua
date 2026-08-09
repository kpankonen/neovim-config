return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-git",
      "tpope/vim-rhubarb",
    },
    config = function()
      local key_opts = require("keyopts")

      vim.keymap.set("x", "<leader>gh", ":GBrowse<cr>", key_opts)
      vim.keymap.set("n", "<leader>gh", ":GBrowse<cr>", key_opts)
    end,
  },
}
