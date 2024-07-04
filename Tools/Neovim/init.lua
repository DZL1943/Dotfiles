vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.showmode = false
-- vim.opt.cmdheight = 0
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 5
-- vim.opt.wildmenu = true
-- vim.opt.wildoptions = 'pum,tagfile'
-- vim.opt.wildmode = 'full'
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true
vim.opt.shortmess:append { s = true, I = true }
vim.opt.signcolumn = 'yes'
-- vim.opt.laststatus = 3
-- vim.opt.showtabline = 2
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.whichwrap = 'bs<>[]hl'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- vim.opt.autochdir = true
-- vim.opt.fileencoding = 'utf-8'
-- vim.opt.fillchars = { eob = ' ' }
-- vim.opt.foldenable = true
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldcolumn = '1'
-- vim.opt.wrap = false
-- vim.opt.linebreak = true
-- vim.opt.showbreak = '=>>'
-- vim.opt.colorcolumn = '80'
-- vim.opt.textwidth = 100
-- vim.opt.breakindent = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.inccommand = 'split'
-- vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- local options = {}
-- for k,v in pairs(options) do
--     vim.optp[k] = v
-- end

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- require("config.lazy")

-- vim.opt.guicursor = ""
vim.cmd.colorscheme "desert"


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- vim.keymap.set("n", "<leader>ww", "<C-W>p")
-- vim.keymap.set("n", "<leader>wd", "<C-W>c")
-- vim.keymap.set("n", "<leader>w-", "<C-W>s")
-- vim.keymap.set("n", "<leader>w|", "<C-W>v")
-- vim.keymap.set("n", "<leader>-", "<C-W>s")
-- vim.keymap.set("n", "<leader>|", "<C-W>v")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "p", '"_dP')
-- vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "<S-l>", ":bnext<CR>")
-- vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

require("user.neovide")
