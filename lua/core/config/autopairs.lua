local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    }
})

npairs.add_rules({
    Rule("(", ")", "lua")
        :with_pair(cond.not_after_regex_check("%%"))
        :with_pair(cond.not_before_regex_check("xxx", 3))
        :with_move(cond.none())
        :with_del(cond.none())
        :with_cr(cond.none())
})

