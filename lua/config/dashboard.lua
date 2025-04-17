local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- ASCII art header

local header = {
  [[      ▄▀  ]],
  [[ █▀▀▀█▀█  ]],
  [[  ▀▄░▄▀   ]],
  [[    █     ]],
  [[  ▄▄█▄▄   ]],
}

dashboard.section.header.val = header
dashboard.section.header.opts.hl = "Function"

-- Menu options with fancy icons
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Keyword"
  b.opts.hl_shortcut = "Type"
  return b
end

dashboard.section.buttons.val = {
  -- button("f", "  Buscar archivo", ":Telescope find_files <CR>"),
  button("n", "  New ", ":ene <BAR> startinsert <CR>"),
  -- button("r", "  Archivos recientes", ":Telescope oldfiles <CR>"),
  -- button("t", "  Buscar texto", ":Telescope live_grep <CR>"),
  -- button("c", "  Configuración", ":e $MYVIMRC <CR>"),
  button("p", "  Plugins", ":Lazy<CR>"),
  -- button("s", "  Restaurar sesión", ":lua require('persistence').load()<CR>"),
  button("q", "  Quit", ":qa<CR>"),
}

-- Footer with plugin count and load time
local function footer()
  local total_plugins = #vim.tbl_keys(require("lazy").plugins())
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return "⚡ " .. total_plugins .. " plugins" .. "   " .. datetime .. nvim_version_info
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

-- Layout configuration
dashboard.config.layout = {
  { type = "padding", val = 2 },
  dashboard.section.header,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}

dashboard.config.opts.noautocmd = true

-- Configure Alpha
alpha.setup(dashboard.config)

-- Automatically open alpha when nvim starts with no arguments
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

    dashboard.section.footer.val = "⚡ " .. stats.count .. " plugins in " .. ms .. "ms"
    pcall(vim.cmd.AlphaRedraw)
  end,
})
