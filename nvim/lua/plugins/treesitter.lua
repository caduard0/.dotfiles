local tree = {
	"nvim-treesitter/nvim-treesitter"
}

tree.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "cpp", "cmake", "lua", "vim", "vimdoc", "bash", "glsl", "llvm", "ninja", "python", "rust"},
	})
end

return tree
