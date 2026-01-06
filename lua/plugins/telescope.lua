return {
  "nvim-telescope/telescope.nvim",
  opts = {
    -- change some options
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        width = 0.95,
        height = 0.9,
        preview_width = 0.4,
      },
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      file_ignore_patterns = { ".ipynb" },
    },
  },
}
