return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    build = ":TSUpdate",
    opts = {
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      
      -- Parsers esenciales - instalar inmediatamente
      ensure_installed = {
        "lua", "vim", "vimdoc", -- Esenciales de Neovim
        "javascript", "typescript", "tsx", -- Tu stack principal
        "html", "css", -- Frontend básico
        "json", "jsonc", -- Configuraciones
        "markdown", "markdown_inline", -- Documentación
      },
      
      -- Auto install cuando abras archivos de estos tipos
      auto_install = true,
      
      -- Remover ignore_install temporalmente para debugging
      -- ignore_install = {},
      
      -- Desactivar query_linter que consume recursos
      query_linter = {
        enable = false,
      },
      
      -- Configuración mínima de incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      
      -- Forzar instalación de lua si no existe
      vim.defer_fn(function()
        local ts_parsers = require("nvim-treesitter.parsers")
        if not ts_parsers.has_parser("lua") then
          vim.cmd("TSInstall lua")
        end
      end, 100)
    end,
  },
}