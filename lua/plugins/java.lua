return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    config = function()
      require("java").setup({
        jdk = {
          auto_install = true, -- Use nvim-java managed JDK 25
        },
        root_markers = {
          "settings.gradle",
          "settings.gradle.kts",
          "pom.xml",
          "build.gradle",
          "mvnw",
          "gradlew",
          "build.gradle.kts",
          ".git",
        },
      })
      vim.lsp.enable("jdtls")
    end,
    keys = {
      { "<leader>jc", function() require("java").compile("full") end, desc = "Java: Compile" },
      { "<leader>jr", function() require("java").runner.built_in.run_app() end, desc = "Java: Run" },
      { "<leader>jt", function() require("java.api.test").run_current_test() end, desc = "Java: Run test" },
      { "<leader>jT", function() require("java.api.test").run_current_class() end, desc = "Java: Run test class" },
    },
  },
}
