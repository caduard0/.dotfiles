local mason = {
		"mason-org/mason-lspconfig.nvim",
		opts={},
		dependencies = {
			{ "mason-org/mason.nvim", opts={} },
			"neovim/nvim-lspconfig"
		}
}

mason.config = function()
	require("mason-lspconfig").setup {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"clangd", "cmake",
			"texlab",
			"pyright",
			"jdtls",
			"glsl_analyzer"
		},
	}
end

mason.setup_capabilities = function(capabilities)
	vim.lsp.config('lua_ls', {capabilities})
	vim.lsp.config('rust_analyzer', {capabilities})
	vim.lsp.config('clangd', {capabilities})
	vim.lsp.config('cmake', {capabilities})
	vim.lsp.config('texlab', {capabilities})
	vim.lsp.config('pyright', {capabilities})
	vim.lsp.config('jdtls', {capabilities})
	vim.lsp.config('glsl_analyser', {capabilities})
end

return mason
