-- List of languages to apply the space indentation settings
local four_space_languages = {
  'c_sharp', 'cpp', 'python',
  'rust', 'sql', 'swift',
  'typescript', 'javascript',
}

-- Function to set indentation to use tabs
local function set_tab_indentation()
    vim.bo.shiftwidth = 0    -- Use the value of 'tabstop'
    vim.bo.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
    vim.bo.softtabstop = 0   -- Use 'shiftwidth' when inserting <Tab>
    vim.bo.expandtab = false -- Use actual tab characters for indentation
end

-- Function to set indentation to 4 spaces
local function set_space_indentation()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
end

-- Space indentation settings for these languages
for _, lang in ipairs(four_space_languages) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = lang,
        callback = set_space_indentation,
    })
end

-- Tab indentation settings for Go
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = set_tab_indentation,
})

