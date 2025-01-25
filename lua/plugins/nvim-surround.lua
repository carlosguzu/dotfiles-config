return {
  "kylechui/nvim-surround",
  version = "*", -- Usa la última versión estable
  event = "VeryLazy", -- Carga solo cuando sea necesario
  config = function()
    require("nvim-surround").setup({
      -- Configuración adicional aquí, o déjalo vacío para usar los valores por defecto
    })
  end,
}
