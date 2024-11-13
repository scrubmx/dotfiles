return {
  'onsails/lspkind.nvim',
  lazy = false,
  priority = 60,
  config = function()
    require('lspkind').init({
      -- Defines how annotations are shown
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- Default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      -- https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf
      preset = 'codicons',

      -- Override preset symbols
      symbol_map = {
        Copilot = '',
        Text = '',
        Method = '',
        Function = '󰊕',
        Constructor = '',
        Field = '',
        Variable = '',
        Class = '',
        Interface = '',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
        Event = '',
        Operator = '',
        TypeParameter = '',
      },

      -- menu = { nvim_lsp = '', nvim_lua = '', luasnip = '', buffer = '', path = '', copilot = '' },
      --  menu = {
      --   nvim_lsp = '',
      --   nvim_lua = '',
      --   luasnip = '',
      --   buffer = '',
      --   path = '',
      --   copilot = '',
      -- },
    })
  end
}
