-- https://github.com/nvimtools/none-ls.nvim
-- https://github.com/nvimtools/none-ls.nvim#setup
return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.completion.proselint,
        -- null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'css', 'scss', 'html', 'markdown', 'markdown.mdx', 'yaml' },
        }),
        -- null_ls.builtins.formatting.markdownlint,
        -- null_ls.builtins.formatting.stylelint,
      },
    })

    -- https://github.com/nvimtools/none-ls.nvim#i-am-seeing-a-formatting-timeout-error-message
    -- vim.lsp.buf.format({ timeout_ms = 2000 })
  end
}
