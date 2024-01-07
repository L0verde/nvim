return { 
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  -- Undoo Tree
  'mbbill/undotree',
  -- Fugitive for git
  'tpope/vim-fugitive',
  -- Harpoon
  {
    " ThePrimeagen/harpoon", 
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
}
