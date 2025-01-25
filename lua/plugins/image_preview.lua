return {
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.window = opts.filesystem.window or {}
      opts.filesystem.window.mappings = opts.filesystem.window.mappings or {}
      opts.filesystem.commands = opts.filesystem.commands or {}

      opts.filesystem.window.mappings["<leader>p"] = "image_wezterm"
      opts.filesystem.commands.image_wezterm = function(state)
        local node = state.tree:get_node()
        if node.type == "file" then
          require("image_preview").PreviewImage(node.path)
        end
      end
    end,
  },
}
