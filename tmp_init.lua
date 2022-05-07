local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug('dracula/vim', { as = 'dracula' })
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
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

vim.api.nvim_set_keymap("n", "<leader>e", ":e $MYVIMRC", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", ":source $MYVIMRC", { noremap = true })

vim.api.nvim_set_keymap("v", "<C-c>", '"+yy', { noremap = true })

vim.api.nvim_set_keymap("t", "<Rsc>", "<C-\\><C-n>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-space>", "<Cmd>CocCommand explorer<CR>", {})


vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true})
vim.api.nvim_set_keymap("n", "gs", ":sp<CR><Plug>(coc-definition)", { silent = true})
vim.api.nvim_set_keymap("n", "gt", "v.lua.OpenDefInNewTab()<CR>", { silent = true})
vim.api.nvim_set_keymap("n", "gy <Plug>", "<Plug>(coc-type-definition)", { silent = true})
vim.api.nvim_set_keymap("n", "gi <Plug>", "<Plug>(coc-implementation)", { silent = true})
vim.api.nvim_set_keymap("n", "gr <Plug>", "<Plug>(coc-references)", { silent = true})
vim.api.nvim_set_keymap("n", "[g <Plug>", "<Plug>(coc-diagnostic-prev)", { silent = true})
vim.api.nvim_set_keymap("n", "]g <Plug>", "<Plug>(coc-diagnostic-next)", { silent = true})
vim.api.nvim_set_keymap("n", "K", "v:lua.ShowDocumentation()<CR>", { silent = true})

function _G.OpenDefInNewTab()
  vim.call("CocAction('jumpDefinition', 'tabe')")
end

function _G.ShowDocumentation()
  vim.call("CocAction('doHover')")
end

function _G.CheckBackSpace()
  local row_col = vim.api.nvim_win_get_cursor(0)
  return vim.api.nvim_get_current_line()[row_col[1] - 1]
end

vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : v:lua.CheckBackSpace() ? "\\<Tab>": coc#refresh()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"<Paste>', { expr = true })
vim.api.nvim_set_keymap("i", "<cr>", 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', { expr = true })
vim.api.nvim_set_keymap("i", "<C-space>", 'coc#refresh()', { silent = true, expr = true })

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

vim.g.lightline = {
  active = {
    left = { {"mode", "paste"}, { "gitbranch", "readonly", "filename", "modified" } }
  },
  tabline = {
    left = { { "statuslinetabs" } }
  },
  bufferline = {
    { show_number = 1, enable_devicons = 1 }
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers',
    statuslinetabs = 'LightlineStatuslineTabs'
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  },
  component_type = {
    buffers = 'tabsel'
  },
  component = {
    filename = '%F'
  }
}

function _G.LightlineStatuslineTabs()
  local data = {}
  for i = 1, table.getn(nvim.api.nvim_list_tabpages()) do
    local filename = vim.fn['lightline#tab#filename'](i)
    local current_file = ""
    if i == nvim.api.nvim_get_current_tabpage() then
      current_file = "[*] "
    else
      current_file = ""
    end
    local new_str = current_file .. filename
    data.insert(new_str)
  end
  return table.concat(data, " \\u2b81 ")
end

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep", { noremap = true })
