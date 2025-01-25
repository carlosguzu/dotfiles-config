return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "javascript",
        "go",
        "typescript",
        "css",
        "tsx",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        -- Añadir más parsers
        "bash",
        "html",
        "markdown",
        "markdown_inline",
        "python",
        "php",
        "query",
        "regex",
        "yaml",
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
}
