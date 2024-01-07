--[[ LSP ]]
local lsp = require'lspconfig'

-- List of LSP servers
local servers = {
    "omnisharp",
    "pyright"
}

for _, lang in ipairs(servers) do
    lsp[servers].setup{}
end
