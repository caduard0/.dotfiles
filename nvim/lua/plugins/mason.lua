local mason = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
}

mason.config = function()
	require("mason").setup()
	require("mason-lspconfig").setup {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"clangd", "cmake",
			"texlab",
			"pyright",
		},
	}

	require'lspconfig'.lua_ls.setup{}
	require'lspconfig'.rust_analyzer.setup{}
	require'lspconfig'.clangd.setup{}
	require'lspconfig'.cmake.setup{}
	require'lspconfig'.texlab.setup{}
	require'lspconfig'.pyright.setup{}
end

return mason
