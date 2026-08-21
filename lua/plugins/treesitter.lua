return {
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      -- Passing install_dir is what prepends it to 'runtimepath'. The default
      -- value is not prepended because it is normally already there, but
      -- lazy.nvim's performance.rtp.reset strips it out. It has to exist on
      -- disk first: lazy.nvim rebuilds 'runtimepath' as each plugin loads and
      -- drops any entry that is not a real directory.
      local install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site")
      vim.fn.mkdir(install_dir, "p")
      treesitter.setup({ install_dir = install_dir })

      vim.treesitter.language.register("terraform", { "tofu" })
      vim.treesitter.language.register("yaml", { "sls" })

      local installable = {}
      for _, lang in ipairs(treesitter.get_available()) do
        installable[lang] = true
      end

      local attempted = {}

      local function start_highlighting(buf, lang)
        if vim.api.nvim_buf_is_valid(buf) then
          pcall(vim.treesitter.start, buf, lang)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-install-on-demand", { clear = true }),
        desc = "Start treesitter, installing the parser first if this machine does not have it",
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end

          if vim.treesitter.language.add(lang) then
            start_highlighting(args.buf, lang)
            return
          end

          if attempted[lang] or not installable[lang] then
            return
          end
          attempted[lang] = true

          treesitter.install(lang):await(function(err, installed)
            vim.schedule(function()
              if err or not installed then
                vim.notify(
                  ("treesitter: could not install %s, see :TSLog"):format(lang),
                  vim.log.levels.WARN
                )
              else
                start_highlighting(args.buf, lang)
              end
            end)
          end)
        end,
      })
    end,
  },
}
