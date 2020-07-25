call plug#begin('~/.local/share/nvim/plugged')

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

let g:deoplete#enable_at_startup = 1


Plug 'davidhalter/jedi-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-fugitive'

Plug 'dense-analysis/ale'

Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'

Plug 'morhetz/gruvbox'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'drewtempelmeyer/palenight.vim'

Plug 'junegunn/fzf'

Plug 'psf/black', { 'tag': '19.10b0' }

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'wsdjeg/FlyGrep.vim'

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

Plug 'mhinz/vim-startify'

call plug#end()

call deoplete#enable() 

nnoremap <Space>s/ :FlyGrep<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_theme='kalisi'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set number
colorscheme gruvbox 
set background=dark
let g:lightline = { 'colorscheme': 'gruvbox' }
let g:airline_theme = "palenight"

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

nnoremap <silent> <leader>vs :vsplit<CR>
nnoremap <silent> <leader>hs :hsplit<CR>

let g:python_highlight_all = 1

"let g:deoplete#auto_complete_delay = 100
call deoplete#custom#option({'auto_complete_delay':100})


" semish sytanx linter
let g:semshi#filetypes = ['python']
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>


function MyCustomHighlights()
    hi semshiGlobal      ctermfg=red guifg=#ff0000
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=214 guifg=#ffaf00
    hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#5fafff
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#ffafd7
    hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
    hi semshiAttribute       ctermfg=49  guifg=#00ffaf
    hi semshiSelf            ctermfg=249 guifg=#b2b2b2
    hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction

autocmd FileType python call MyCustomHighlights()

autocmd ColorScheme * call MyCustomHighlights()


"black
nnoremap <F9> :Black<CR>
autocmd BufWritePost *.py silent! execute ':Black'




"cursor
set mouse=a

"ALE linter
let g:ale_linters = {'python': ['flake8']}

"doctstring
let g:pydocstring_formatter = 'google'
nnoremap <F4> :Pydocstring<CR>

"PRE Requeirements.
"Install in base libraby
"pip install pynvim --upgrade 
"pip install flake8
"pip install black
"pip instal jedi
"
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
