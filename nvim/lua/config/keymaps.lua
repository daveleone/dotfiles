-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Switch j and k behaviour
keymap.set("n", "j", "k", opts)
keymap.set("n", "k", "j", opts)
keymap.set("v", "j", "k", opts)
keymap.set("v", "k", "j", opts)

-- Move line
keymap.set("n", "<C-Up>", ":m .-2<CR>==", opts)
keymap.set("n", "<C-Down>", ":m .+1<CR>==", opts)
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)

-- ToggleTerm
keymap.set("n", "tt", ":ToggleTerm<Return>")

function _G.set_terminal_keymaps()
  local optss = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], optss)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], optss)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], optss)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], optss)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], optss)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], optss)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], optss)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
