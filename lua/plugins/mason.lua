return {
  "mason-org/mason.nvim",
  opts = {
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
    ensure_installed = {
      "prettierd",
      "emmet-ls",
      "eslint_d",
      "templ",
      "buf",
      -- Java tools for nvim-java
      "java-test",
      "java-debug-adapter",
      "google-java-format",
      "checkstyle",
      -- jdtls is NOT installed via Mason - nvim-java manages it directly
    },
  },
}
