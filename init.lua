local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug('dracula/vim', { as = 'dracula' })
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'TimUntersberger/neogit'
Plug('mg979/vim-visual-multi', {branch = 'master'})
Plug 'lewis6991/gitsigns.nvim'
vim.call('plug#end')
vim.cmd(
[[
set nu
set backspace=2
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
colorscheme dracula

set showtabline=2

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.lua set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.c set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.h set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.json set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120 expandtab autoindent fileformat=unix
set foldmethod=indent
set foldlevel=99
]]
)

vim.g.webdevicons_enable = 1
vim.g.mapleader = "<"

vim.api.nvim_set_keymap("n", "<leader><Down>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><Up>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><Right>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><Left>", "<C-W><C-H>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>b", ":bprev", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":bnext", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>e", ":e $MYVIMRC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", ":source $MYVIMRC<CR>", { noremap = true })

vim.api.nvim_set_keymap("v", "<C-c>", '"+yy', { noremap = true })

vim.api.nvim_set_keymap("t", "<Rsc>", "<C-\\><C-n>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-space>", "<Cmd>CocCommand explorer<CR>", {})


function OpenDefInNewTab()
  vim.fn.CocAction("jumpDefinition", "tabe")
end

function ShowDocumentation()
  vim.fn.CocAction("doHover")
end

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true})
vim.api.nvim_set_keymap("n", "gs", ":sp<CR><Plug>(coc-definition)", { silent = true})
vim.keymap.set("n", "gq", OpenDefInNewTab, { silent = true})
vim.api.nvim_set_keymap("n", "gy <Plug>", "<Plug>(coc-type-definition)", { silent = true})
vim.api.nvim_set_keymap("n", "gi <Plug>", "<Plug>(coc-implementation)", { silent = true})
vim.api.nvim_set_keymap("n", "gr <Plug>", "<Plug>(coc-references)", { silent = true})
vim.api.nvim_set_keymap("n", "[g <Plug>", "<Plug>(coc-diagnostic-prev)", { silent = true})
vim.api.nvim_set_keymap("n", "]g <Plug>", "<Plug>(coc-diagnostic-next)", { silent = true})
vim.keymap.set("n", "K", ShowDocumentation, { silent = true, noremap = true})

function _G.CheckBackSpace()
  local row_col = vim.api.nvim_win_get_cursor(0)
  return vim.api.nvim_get_current_line()[row_col[1] - 1]
end

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : v:lua.CheckBackSpace() ? "\\<Tab>": coc#refresh()', { silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<cr>", 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<c-space>", 'coc#refresh()', { silent = true, expr = true, noremap = true })

vim.api.nvim_set_keymap("n", "<leader>a", "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("v", "<leader>a", "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>(coc-format-selected)", {})
vim.api.nvim_set_keymap("v", "<leader>f", "<Plug>(coc-format-selected)", {})


vim.api.nvim_set_keymap("n", "<leader>1", "1gt", {})
vim.api.nvim_set_keymap("n", "<leader>2", "2gt", {})
vim.api.nvim_set_keymap("n", "<leader>3", "3gt", {})
vim.api.nvim_set_keymap("n", "<leader>4", "4gt", {})
vim.api.nvim_set_keymap("n", "<leader>5", "5gt", {})
vim.api.nvim_set_keymap("n", "<leader>6", "6gt", {})


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {{'tabs', mode = 2}},
  },
  extensions = {}
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep", { noremap = true })

require('gitsigns').setup()
