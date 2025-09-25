---@diagnostic disable: undefined-field
local nvimcmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
}

nvimcmp.config = function()
	local cmp = require("cmp")

	cmp.setup({
    	snippet = {
      		-- REQUIRED - you must specify a snippet engine
      		expand = function(args)
        		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        		-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      		end,
    	},
	    window = {
	    	-- completion = cmp.config.window.bordered(),
	    	-- documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
			['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

	    	['<C-j>'] = cmp.mapping.select_next_item(),
	    	['<C-k>'] = cmp.mapping.select_prev_item(),

	    	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	    	['<C-f>'] = cmp.mapping.scroll_docs(4),
	    	['<C-Space>'] = cmp.mapping.complete(),
	    	['<C-e>'] = cmp.mapping.abort(),
	    }),
	    sources = cmp.config.sources({
	    	{ name = 'nvim_lsp' },
	    	{ name = 'vsnip' }, -- For vsnip users.
	    	-- { name = 'luasnip' }, -- For luasnip users.
	    	-- { name = 'ultisnips' }, -- For ultisnips users.
	    	-- { name = 'snippy' }, -- For snippy users.
	    }, {
	      { name = 'buffer' },
	    })
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
    	mapping = cmp.mapping.preset.cmdline(),
    	sources = {
    		{ name = 'buffer' }
    	}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	})

	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require'lspconfig'['lua_ls'].setup { capabilities = capabilities }
	require'lspconfig'['rust_analyzer'].setup { capabilities = capabilities }
	require'lspconfig'['clangd'].setup { capabilities = capabilities }
	require'lspconfig'['cmake'].setup { capabilities = capabilities }
	require'lspconfig'['texlab'].setup { capabilities = capabilities }
	require'lspconfig'['pyright'].setup { capabilities = capabilities }
end


return nvimcmp
