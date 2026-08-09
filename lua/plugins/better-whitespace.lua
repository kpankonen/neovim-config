return {
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.keymap.set("n", "<leader>sw", "<cmd>StripWhitespace<cr>", require("keyopts"))
    end,
  },
}
