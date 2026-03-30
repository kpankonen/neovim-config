return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "python",
        "vim",
      },
      auto_install = true,
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what inter ests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  },
}
