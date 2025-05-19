vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
keymap.set('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true, desc = "Go to previous buffer" })

keymap.set('n', '<leader>ca', function()
	vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })

vim.keymap.set('n', 'gd', function()
	vim.lsp.buf.definition()
end, { desc = "Go to Definition" })

vim.keymap.set('n', 'gr', function()
	vim.lsp.buf.references()
end, { desc = "Go to References" })


-- normal mode mapping
keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open New Tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" })
keymap.set("n", "<leader>tl", ":tabn<CR>", { desc = "Go to Next Tab" })
keymap.set("n", "<leader>th", ":tabp<CR>", { desc = "Go to Previous Tab" })
keymap.set("n", "<leader>wo", ":only<CR>", { desc = "Close other windows" })
keymap.set("n", "<leader>tt", ":tab :term<CR>", { desc = "Opens terminal in new tab" })
keymap.set("n", "<leader>ln", ":set nornu | set nonu<CR>", { desc = "Turn off line numbers" })
keymap.set("n", "<leader>ly", ":set rnu | set nu<CR>", { desc = "Turn on line numbers" })

-- Toggle diagnostic display mode (inline vs below line)
keymap.set("n", "<leader>td", function()
    local virtual_lines_enabled = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({
        virtual_text = virtual_lines_enabled,
        virtual_lines = not virtual_lines_enabled,
    })
end, { desc = "Toggle diagnostic display mode" })

-- terminal mapping
keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Go to normal mode in terminal" })
