return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  config = function ()
     -- source: https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
     -- Somewhere in your Neovim startup, e.g. init.lua
    require("luasnip").config.set_config({ -- Setting LuaSnip config

      -- Enable autotriggered snippets
      enable_autosnippets = true,

      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = "<Tab>",
    })
  end
}
