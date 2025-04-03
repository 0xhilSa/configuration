vim.opt.syntax = "on"
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.mouse = ""
vim.opt.scrolloff = 5

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr-o:block"

vim.keymap.set("v", "<A-Left>", "<gv")
vim.keymap.set("v", "<A-Right>", ">gv")
vim.keymap.set("v", "<A-Up>", "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", "<cmd>m '>+1<CR>gv=gv")

vim.keymap.set("n", "<A-Left>", "<<")
vim.keymap.set("n", "<A-Right>", ">>")
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<CR>==")
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<leader>hl", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-Left>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>bnext<CR>")

vim.cmd[[highlight Visual ctermbg=DarkGray guibg=DarkGray]]
vim.cmd[[hi Cursor guifg=black guibg=gray]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab"
})

vim.opt.background = "dark"
vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Git Files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, { desc = "Find in Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = "File History" })

vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
