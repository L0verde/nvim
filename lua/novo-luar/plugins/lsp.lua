-- [[ LSP ]] 
return{
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Mason : Package manager for LSP & DAP servers, linters, & fromatters
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- cmp: Completion engine
    -- Sources are installed from external repositories and "sourced".
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- Luasnip: 
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- Fidget: UI for Neovim notifications and LSP progress messages
    'j-hui/fidget.nvim',
  },
  config = function()
    local cmp = require'cmp'
    local cmp_lsp = require('cmp_nvim_lsp')
    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )
    require('fidget').setup({})
    require('mason').setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        --[[ General Purpose ]]
        'clangd', 'omnisharp', --[[C family]]
        'lua_ls', --Lua
        'rust_analyzer', --Rust

        --[[ Web Dev ]]
        'unocss',  --CSS
        'tsserver', --[[Javascript/Typescript]]
        'solargraph', --Ruby

        --[[ Data ]]
        'julials', --Julia
        'pyright', --Python

        --[[ Data base ]]
        'sqls', -- sql

        --[[ DevOps]]
        'dockerls', --Docker

        --[[ Markup/Markdown ]]
        'texlab', --Latex
        'html',

      },
      handlers = {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities
          }
        end,

        ['lua_ls'] = function ()
          local lspconfig = require('lspconfig')
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          }
        end,
        ['sqls'] = function()
          local lspconfig = require('lspconfig')
          lspconfig.sqls.setup {
            capabilities = capabilities,
            settings = {
              sqls = {
                connections = {
                  {
                    driver = "postgresql",
                    dataSourceName = "host=localhost port=5432 user=jake dbname=suitcase password=brazil sslmode=disable"
                  }
                }
              }
            }
          }
        end,

      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    require('cmp').setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      },{
          { name = 'buffer' },
        })
    })

    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      }
    })
  end,
}
