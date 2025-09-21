local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()


-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {

            expand = function(args)

                luasnip.lsp_expand(args.body)
            end,

    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },

        { name = "path" },

    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<CR>"] = cmp.mapping.confirm(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),

        ["<C-j>"] = cmp.mapping.select_next_item(),

    }),
    formatting = {

            format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = "..."

            })

    }
--    complete = { completeopt = "menu,menuone,noinsert"}

})
