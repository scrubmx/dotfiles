-- https://github.com/kevinhwang91/nvim-ufo
-- Make Neovim's fold look modern and keep high performance.
return {
  'kevinhwang91/nvim-ufo',
  event = 'VeryLazy',
  dependencies = {
    'kevinhwang91/promise-async',
    -- 'nvim-treesitter/nvim-treesitter',
  },
  init = function()
    -- https://github.com/kevinhwang91/nvim-ufo#highlight-groups

    -- vim.cmd([[highlight default UfoFoldedFg guifg=Normal.foreground]])
    -- vim.cmd([[highlight default UfoFoldedBg guibg=Folded.background]])
    vim.cmd([[highlight default link UfoPreviewSbar PmenuSbar]])
    vim.cmd([[highlight default link UfoPreviewThumb PmenuThumb]])
    vim.cmd([[highlight default link UfoPreviewWinBar UfoFoldedBg]])
    vim.cmd([[highlight default link UfoPreviewCursorLine Visual]])
    vim.cmd([[highlight default link UfoFoldedEllipsis Comment]])
    vim.cmd([[highlight default link UfoCursorFoldedLine CursorLine]])

    -- vim.api.nvim_set_hl(0, 'PmenuSbar', { default = true, link = 'UfoPreviewSbar' })
    -- vim.api.nvim_set_hl(0, 'UfoPreviewSbar', { default = true, link = 'PmenuSbar' })

    -- • {val}    Highlight definition map, accepts the following keys:
    --           • fg (or foreground): color name or "#RRGGBB", see note.
    --           • bg (or background): color name or "#RRGGBB", see note.
    --           • sp (or special): color name or "#RRGGBB"
    --           • blend: integer between 0 and 100
    --           • bold: boolean
    --           • standout: boolean
    --           • underline: boolean
    --           • undercurl: boolean
    --           • underdouble: boolean
    --           • underdotted: boolean
    --           • underdashed: boolean
    --           • strikethrough: boolean
    --           • italic: boolean
    --           • reverse: boolean
    --           • nocombine: boolean
    --           • link: name of another highlight group to link to, see
    --             |:hi-link|.
    --           • default: Don't override existing definition |:hi-default|
    --           • ctermfg: Sets foreground of cterm color |ctermfg|
    --           • ctermbg: Sets background of cterm color |ctermbg|
    --           • cterm: cterm attribute map, like |highlight-args|. If not
    --             set, cterm attributes will match those from the attribute
    --             map documented above.
    --
  end,
  config = function()
    require('ufo').setup({
      -- provider_selector = function(bufnr, filetype, buftype)
      -- return { 'treesitter', 'indent' }
      -- end,

      -- fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      --   local newVirtText = {}
      --   local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      --   local sufWidth = vim.fn.strdisplaywidth(suffix)
      --   local targetWidth = width - sufWidth
      --   local curWidth = 0
      --   for _, chunk in ipairs(virtText) do
      --     local chunkText = chunk[1]
      --     local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      --     if targetWidth > curWidth + chunkWidth then
      --       table.insert(newVirtText, chunk)
      --     else
      --       chunkText = truncate(chunkText, targetWidth - curWidth)
      --       local hlGroup = chunk[2]
      --       table.insert(newVirtText, { chunkText, hlGroup })
      --       chunkWidth = vim.fn.strdisplaywidth(chunkText)
      --       -- str width returned from truncate() may less than 2nd argument, need padding
      --       if curWidth + chunkWidth < targetWidth then
      --         suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      --       end
      --       break
      --     end
      --     curWidth = curWidth + chunkWidth
      --   end
      --   table.insert(newVirtText, { suffix, 'MoreMsg' })
      --   return newVirtText
      -- end,
    })

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)
  end,
}
