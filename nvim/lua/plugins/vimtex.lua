local vimtex = {
  "lervag/vimtex",
  lazy = false,
}

vimtex.config = function()
	-- VimTeX configuration goes here, e.g.
	vim.g.vimtex_view_method = "zathura"
	vim.g.vimtex_compiler_latexmk = {
		options = {
			'-verbose',
			'-shell-escape',
		},
	}
end

return vimtex
