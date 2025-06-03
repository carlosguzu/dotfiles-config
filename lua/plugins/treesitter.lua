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
      
      -- Solo parsers críticos para startup rápido
      ensure_installed = {
        "lua", "vim", -- Esenciales de Neovim
        "javascript", "typescript", "tsx", -- Tu stack principal
        "html", "css", -- Frontend básico
        "json", -- Configuraciones
        "markdown", "markdown_inline", -- Documentación
      },
      
      -- Mover parsers menos críticos a ignore_install
      ignore_install = { 
        "printf", "xml", "comment", "jsdoc",
        -- Estos se pueden instalar bajo demanda:
        "scss", "yaml", "bash", 
        "go", "python", "php",
        "gitignore", "graphql", "http", "sql", "query", "regex"
      },
      
      -- Desactivar query_linter que consume recursos
      query_linter = {
        enable = false, -- Desactivar para mejor performance
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
  },
}