local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    },
    fast_wrap = {},
})

npairs.add_rules({
    Rule("(", ")", "lua")
        :with_pair(cond.not_after_regex_check("%%"))
        :with_pair(cond.not_before_regex_check("xxx", 3))
        :with_move(cond.none())
        :with_del(cond.none())
        :with_cr(cond.none())
})

-- Интеграция с coc.nvim
_G.MUtils= {}

MUtils.CR = function()
    if vim.fn['coc#pum#visible']() ~= 0 then
        return vim.fn['coc#_select_confirm']()
    else
        return npairs.autopairs_cr()
    end
end

vim.api.nvim_set_keymap('i' , '<CR>', 'v:lua.MUtils.CR()', {expr = true , noremap = true})

