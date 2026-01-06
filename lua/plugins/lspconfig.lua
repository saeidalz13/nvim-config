local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    servers = {
      -- relay_lsp removed - command not installed
      html = {
        filetypes = { "html", "eruby" },
      },
      tailwindcss = {
        filetypes = { "templ" },
        init_options = {
          userLanguages = {
            templ = "html",
          },
        },
      },
      eslint = {
        root_dir = get_root_dir,
      },
      tsserver = {
        root_dir = get_root_dir,
      },
      rubocop = {
        mason = false,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      },
      clangd = {
        -- NOTE: need this to exclude .proto
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
      },
      golangci_lint_ls = {
        init_options = {
          command = {
            "golangci-lint",
            "run",
            "--output.json.path",
            "stdout",
            "--show-stats=false",
            "--issues-exit-code=1",
          },
        },
      },
    },
  },
}
