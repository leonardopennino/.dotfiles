-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
local cmp = require 'cmp'
local types = require("cmp.types")

local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
end

cmp.setup({
	completion = {
		-- completeopt = 'menu,menuone,noinsert',
	},
	snippet = {
		expand = function(args) require('luasnip').lsp_expand(args.body) end
	},
	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			vim_item.kind = require("lspkind").presets.default[vim_item.kind]
			-- set a name for each source
			vim_item.menu = ({
				buffer = "[Buff]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]"
			})[entry.source.name]
			return vim_item
		end
	},
	sources = {
		{ name = 'nvim_lsp' }, { name = 'nvim_lua' }, { name = 'path' },
		{ name = 'luasnip' }, { name = 'buffer', keyword_length = 1 },
		{ name = 'calc' }, { name = 'nvim_lsp_signature_help' }
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			deprioritize_snippet,
			-- the rest of the comparators are pretty much the defaults
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.scopes,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	}

})

-- Require function for tab to work with LUA-SNIP
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and
			vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
				col)
			:match("%s") == nil
end
local luasnip = require("luasnip")

cmp.setup({
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-[>'] = cmp.mapping.scroll_docs(-4),
		['<C-]>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false
		}),
		['<C-k>'] = cmp.mapping.open_docs(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" })

	}
})
