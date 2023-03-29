call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround' " surrounding text objects with paranthesis, quotes, html tags...
" Plug 'junegunn/goyo.vim'
" Plug 'tidalcycles/vim-tidal'
" let g:tidal_target = "terminal"
" Plug 'beauwilliams/statusline.lua'
" Plug 'tpope/vim-fugitive' "wrapper for git
" Plug 'PotatoesMaster/i3-vim-syntax' " i3 config
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'itchyny/calendar.vim'
" themes
" Plug 'arcticicestudio/nord-vim'
" Plug 'morhetz/gruvbox'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'dylanaraps/wal.vim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

set nocompatible
filetype off

let mapleader=","
let maplocalleader=","


"   +-------------+
"   | Set options |
"   +-------------+


syntax enable
filetype indent on
filetype plugin on
set incsearch
set ignorecase
set mouse=a
set nohlsearch
set ruler
set shiftround
set showcmd
set smarttab
set textwidth=79
set clipboard+=unnamedplus
set noswapfile
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set number
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartcase
" Give more space for displaying messages.
set cmdheight=2
set nobackup
set nowritebackup
set updatetime=300

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  " if (has("termguicolors"))
    " set termguicolors
  " endif
endif

" Use <c-space> to trigger copilot completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" In Visual mode, use space to deselect.
vmap <silent> <space> <esc>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Nord theme configuration
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1

let g:gruvbox_contrast_dark = 'hard'
colorscheme wal


"    +---------+
"    | Mapping |
"    +---------+

" Add timestamp
nmap <F5> !!date "+\%Y/\%m/\%d-\%H:\%M"<C-R><Esc>

" Replace ESC with fd
:imap fd <Esc>

" Change window focus with Tab
" nmap <Tab> <C-W>w

nnoremap b B
nnoremap e E
nnoremap B 0
nnoremap E $

" Switch tabs
nmap <S-t> gt

" Moving in long lines
nnoremap j gj
nnoremap k gk

" indent without killing the selection in VISUAL mode
vmap < <gv
vmap > >gv

" arrow keys resize windows
nnoremap <left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +10<cr>
nnoremap <up> :resize -10<cr>
nnoremap <down> :resize +10<cr>

" marks
nmap è `

" Shift+h to hide everything :
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set nonumber
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        set number
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" ---- Vimwiki settings ---- "
let g:vimwiki_auto_header=1

let wiki_main = {}
let wiki_main.path = '~/Documents/vimwiki'
let wiki_main.path_html = '~/Documents/vimwiki/html'

let wiki_website = {}
let wiki_website.path = '~/Documents/wiki_website'
let wiki_website.path_html = "$HOME/Repos/antharia.github.io/" 
let wiki_website.name = 'antharia.github.io'
let wiki_website.auto_export = 1
let wiki_website.template_path = "$HOME/Repos/antharia.github.io/templates"
let wiki_website.template_default = "default"
let wiki_website.template_ext = ".html"

let wiki_rpg = {}
let wiki_rpg.path = '~/Documents/wiki_rpg'
let wiki_rpg.path_html = '~/Documents/wiki_rpg/html'
let wiki_rpg.name = 'wiki_rpg'

let wiki_portfolio = {}
let wiki_portfolio.path = '~/Documents/wiki_portfolio'
let wiki_portfolio.path_html = '~/Documents/wiki_portfolio/html'
" let wiki_portfolio.syntax = 'markdown'
" let wiki_portfolio.ext = '.md'
let wiki_portfolio.name = 'portfolio'

let g:vimwiki_list = [wiki_main, wiki_website, wiki_rpg, wiki_portfolio]

au filetype vimwiki silent! iunmap <buffer> <Tab>

" ---- Coc settings ---- "

autocmd FileType python let b:coc_root_patterns = ['.git', '.venv']

" ---- nvim-autopairs settings ---- "

lua << EOF
require("nvim-autopairs").setup() 
EOF

" ---- lualine settings ---- "
"
lua << EOF
require("lualine").setup()
EOF

" ---- copilot settings ---- "
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ---- nvim-tree settings ---- "
lua << EOF

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

EOF

nmap <leader>n :NvimTreeToggle<CR>
