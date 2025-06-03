return {
  {
    "dense-analysis/ale",

    config = function()
      vim.keymap.set("n", "<C-j>", "<Plug>(ale_next_wrap)", key_opts)
      vim.keymap.set("n", "<C-k>", "<Plug>(ale_previous_wrap)", key_opts)
      vim.keymap.set("n", "<leader>a", "<cmd>ALEToggle<cr>", key_opts)
      vim.keymap.set("n", "<F3>", "<cmd>ALEToggle<cr>", key_opts)
      vim.g["ale_go_golangci_lint_package"] = 1

      vim.g["ale_linter_aliases"] = {
        ["yaml.k8s"] = "yaml",
      }

      vim.cmd([[
        autocmd FileType yaml.k8s let b:ale_yaml_yamllint_options = "--config-data '{extends: relaxed, rules: {indentation: {spaces: 2, indent-sequences: consistent}, line-length: disable}}'"
      ]])
    end,
  },
}
