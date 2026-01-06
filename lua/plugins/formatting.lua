return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      java = { "google-java-format" },
    },
    formatters = {
      ["google-java-format"] = {
        prepend_args = { "--aosp" }, -- Use AOSP style (4 spaces) instead of Google style (2 spaces)
      },
    },
  },
}
