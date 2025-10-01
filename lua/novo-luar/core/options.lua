local o = vim.opt

-- Copy & Cut to clipboard
o.clipboard:append("unnamedplus")

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- line wrapping
o.wrap = false -- disable line wrapping

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

-- tabs & indentation
o.tabstop = 2       -- 2 spaces for tabs (prettier default)
o.shiftwidth = 2    -- 2 spaces for indent width
o.softtabstop = 2   -- make <Tab> and <BS> behave like shiftwidth
o.expandtab = true  -- expand tab to spaces
o.smarttab = true   -- makes <Tab> at line start use shiftwidth
o.autoindent = true -- copy indent from current line when starting new one
o.smartindent = false -- disable smart C-like indentation

-- Optional: Insert-mode Tab always inserts spaces according to buffer settings
-- This ensures Tab works consistently per-language
_G.tab_complete = function()
  local n = vim.bo.softtabstop
  if n == 0 then n = vim.bo.shiftwidth end
  if n == 0 then n = 2 end
  return string.rep(" ", n)
end

vim.keymap.set('i', '<Tab>', 'v:lua.tab_complete()', { expr = true, noremap = true })


-- =====================
-- Per-Language Indentation
-- =====================

-- 4-space families
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python","c","cpp","java", "lua"},
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end
})

-- 2-space families
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"ruby","javascript","typescript","html","css","json"},
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end
})
