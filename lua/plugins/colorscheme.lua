return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.gruvbox_material_background = "hard" -- Options: soft, medium, hard
      vim.g.gruvbox_material_palette = "mix" -- Options: material, mix, original
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 1 -- Enable transparency
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
