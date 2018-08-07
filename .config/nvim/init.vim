" https://medium.com/@boiser/a-vim-poser-s-guide-to-neovim-ea79e95c31cd

" Run :PlugInstall from inside NeoVim
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf' " fuzzy file search with fzf
Plug 'junegunn/fzf.vim'
Plug 'avakhov/vim-yaml' " VIM yaml formatter
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " directory tree browser
Plug 'rking/ag.vim'                                     " full text search with silver surfer
Plug 'Lokaltog/vim-powerline'                           " Powerline smart statusline.
Plug 'scrooloose/syntastic'                             " Integration for external syntax checkers.
call plug#end()

" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap <C-p> :FZF<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 

" Swap semi-colon and colon
"noremap ; :
"noremap : ;

set showmatch           " Show matching brackets.
set ruler               " Always show current position
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set cursorline          " Highlight current line
"set magic              " Set magic on, for regexps
set showmatch           " Show matching brackets when text indicator on top of one
set title               " Show the filename
set showcmd             " Show commands when entered

" Tabbing
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
vnoremap < <gv
vnoremap > >gv

" Search Behavior
set hlsearch            " Highlight search pattern matches
set incsearch           " Make search look within strings
nnoremap n nzz             " Center searches?
nnoremap N Nzz          " Center searches?

" Colors
syntax enable           " enable syntax color schemes without overwriting existing highlighting rules
set t_Co=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
" colorscheme solarized

" Fonts
set gfn=Bitstream\ Vera\ Sans\ Mono:h10
set encoding=utf8
set ffs=unix,dos,mac

" Wildmenu (http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse)
set wildmenu
set wildmode=longest:full,full

" Find file with command shift o
nnoremap <D-S-o> :FZF<CR>

set shellcmdflag=-ic        " Start in interactive mode


" Disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

