return {
  {
    "dense-analysis/ale",
    -- "kpankonen/ale",
    -- branch = "terraform-trivy",

    config = function()
      local key_opts = require("keyopts")

      vim.keymap.set("n", "<C-j>", "<Plug>(ale_next_wrap)", key_opts)
      vim.keymap.set("n", "<C-k>", "<Plug>(ale_previous_wrap)", key_opts)
      vim.keymap.set("n", "<leader>a", "<cmd>ALEToggle<cr>", key_opts)
      vim.keymap.set("n", "<F3>", "<cmd>ALEToggle<cr>", key_opts)
      vim.g["ale_go_golangci_lint_package"] = 1
      vim.g["ale_terraform_trivy_options"] = "--tf-exclude-downloaded-modules --severity LOW,MEDIUM,HIGH,CRITICAL"

      vim.g["ale_linter_aliases"] = {
        ["yaml.k8s"] = "yaml",
        ["tofu"] = "terraform",
      }

      local terraform_pace = { ale_lint_delay = 60000, ale_lint_on_insert_leave = 0 }

      vim.g["ale_pattern_options"] = {
        ["\\.tf$"] = terraform_pace,
        ["\\.tofu$"] = terraform_pace,
      }

      vim.cmd([[
        autocmd FileType yaml.k8s let b:ale_yaml_yamllint_options = "--config-data '{extends: relaxed, rules: {indentation: {spaces: 2, indent-sequences: consistent}, line-length: disable}}'"
      ]])
    end,
  },
}
