
local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
}

M.config = function ()
	vim.o.foldcolumn = '1'
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.keymap.set('n', '<leader>r', require('ufo').openAllFolds, { desc = "Open all folds"})
	vim.keymap.set('n', '<leader>m', require('ufo').closeAllFolds , { desc = "Close all folds"})
	vim.keymap.set('n', '<leader>k', function ()
		local winid = require('ufo').peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end, { desc = "Open all folds"})

	require('ufo').setup {
		provider_selector = function(bufnr, filetype, buftype)
			return { 'lsp', 'indent' }
		end
	}
end

return M
