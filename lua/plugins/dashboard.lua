return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = vim.fn.argc(-1) == 0, -- Solo mostrar si no hay archivos
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Cargar configuración solo cuando sea necesario
    require("config.dashboard")
  end,
}