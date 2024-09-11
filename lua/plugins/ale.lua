return {
  {
    "dense-analysis/ale",

    config = function()
      vim.keymap.set("n", "<C-j>", "<Plug>(ale_next_wrap)", key_opts)
      vim.keymap.set("n", "<C-k>", "<Plug>(ale_previous_wrap)", key_opts)
      vim.keymap.set("n", "<leader>a", "<cmd>ALEToggle<cr>", key_opts)
    end,
  },
}
