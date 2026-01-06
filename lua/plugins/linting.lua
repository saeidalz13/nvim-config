return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      -- Disabled checkstyle for Java - LSP provides better diagnostics
      -- java = { "checkstyle" },
    },
  },
}
