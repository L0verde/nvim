return {
  -- amongst your other plugins
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
      insert_mappings = true,  -- Apply the open mapping in insert mode
      terminal_mappings = true, -- Apply the open mapping in terminal mode
    }
  end

}
