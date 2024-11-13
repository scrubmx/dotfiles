-- https://github.com/windwp/nvim-ts-autotag
return {
  'windwp/nvim-ts-autotag',
  event = 'VeryLazy',
  confing = function()
    require('nvim-ts-autotag').setup()
  end,
}
