vim.o.termguicolors = true
require('rose-pine').setup({
     disable_italics = true
})

require('vague').setup({
    style = {
        boolean = "none",
        number = "none",
        float = "none",
        error = "none",
        comments = "none",
        conditionals = "none",
        functions = "none",
        headings = "bold",
        operators = "none",
        strings = "none",
        variables = "none",

    }
})
vim.cmd [[ colorscheme rose-pine]]
