return {
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.keymap.set("n", "<leader>sw", "<cmd>StripWhitespace<cr>", key_opts)
    end,
  },
}
