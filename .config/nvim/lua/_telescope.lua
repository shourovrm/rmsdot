local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  return
end

local trouble_ok, trouble = pcall(require, "trouble")
if not trouble_ok then
  return
end

telescope.setup({
  extensions = {
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
  defaults = {
    border = true,
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 0.30,
      width = 1.00,
    },
    -- path_display = { "shorten" },
    sorting_strategy = "ascending",
  },
})

require("telescope").load_extension "file_browser"

trouble.setup({
  icons = false,
})
