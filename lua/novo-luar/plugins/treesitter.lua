-- Define a local table with all the languages
local languages = {
  'bash', 'c_sharp', 'cpp', 'clojure', 'dockerfile',
  'go', 'haskell', 'javascript', 'json', 'julia',
  'latex', 'lua', 'org', 'python', 'ruby',
  'rust', 'sql', 'swift', 'typescript', 'vimdoc',
}
return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    ft = languages,  -- Use the languages table for file type triggers
    config = function () 
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = languages,  -- Use the languages table for ensured installations
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  }
}
