local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local set = vim.opt

vim.g.mapleader = ","

set.number = true
set.relativenumber = true
set.termguicolors = true
set.tabstop = 4
set.shiftwidth=4

map("i", "kj", "<ESC>")
map("n", "<C-o>", ":Neotree filesystem reveal toggle<CR>")

map("n", "<C-f>", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<S-f>", ":lua require('telescope.builtin').live_grep()<CR>")

map("n", "<leader><CR>", ":ToggleTerm<CR>")
