local opt = vim.opt

opt.relativenumber = true -- disables relative line numbering
opt.number = true -- turns on line numbers

opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = false
opt.autoindent = true
opt.mouse = ""

opt.wrap = false

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.opt.showmode = false -- turns off the status line in favor of lualine

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- Configure diagnostics to show inline
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

