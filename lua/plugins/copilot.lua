-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  "github/copilot.vim",
  event = { "InsertEnter", "CmdlineEnter" }, -- carga bajo demanda
  config = function()
    -- 1) Mapea la tecla <Tab> para aceptar la sugerencia de Copilot
    -- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })

    -- Desactiva el mapeo por defecto de <Tab>
    vim.g.copilot_no_tab_map = true

    -- Mapeo condicional para <Tab>
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true, noremap = true })

    -- Función Lua que elige si aceptar sugerencia o insertar tab
    _G.tab_complete = function()
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" and vim.fn.pumvisible() == 0 then
        return copilot_keys
      else
        return "\t"
      end
    end

    -- 2) Si prefieres usar <C-J> / <C-K> para navegar sugerencias:
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", "copilot#Next()", { silent = true, expr = true, noremap = true })
    vim.api.nvim_set_keymap("i", "<C-K>", "copilot#Previous()", { silent = true, expr = true, noremap = true })

    -- 3) Opciones de Copilot (por ejemplo, desactivar panel lateral)
    vim.g.copilot_enabled = true
    vim.g.copilot_filetypes = {
      ["*"] = true, -- activar en todos los tipos de archivo...
      ["markdown"] = false, -- ...excepto Markdown
    }

    -- 4) Comandos útiles
    -- :Copilot enable/disable
    -- :Copilot status

    -- 5) Si quieres ver la ventana con las sugerencias en tiempo real:
    vim.cmd([[
      let g:copilot_window = 'vertical'
    ]])
  end,
}
