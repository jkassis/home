" Run :PlugInstall from inside NeoVim
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf'                               " fzf fuzzy search with fzf
Plug 'junegunn/fzf.vim'                                 " fzf fuzzy search
Plug 'avakhov/vim-yaml'                                 " VIM yaml formatter
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " directory tree browser
Plug 'vim-airline/vim-airline'                          " Lightweight statusline (since powerline is deprecated)
Plug 'scrooloose/syntastic'                             " Integration for external syntax checkers.
Plug 'pangloss/vim-javascript'                          " Syntax highlighting and improved indentation.
Plug 'tbastos/vim-lua'                                  " Improved Lua 5.3 syntax and indentation support for Vim
Plug 'christoomey/vim-tmux-navigator'                   " Use same shortcuts for tmux and vim pane navigation
Plug 'groenewege/vim-less'                              " Syntax highlighting for less files
Plug 'ekalinin/Dockerfile.vim'                          " Syntax highlighting for Dockerfiles
Plug 'fatih/vim-go'                                     " Go development plugin for Vim
Plug 'mileszs/ack.vim'                                  " ACK full-text searching with quickfix window
"Plug 'yuttie/comfortable-motion.vim'                    " Smooth, inertial scrolling
call plug#end()

" ACK Options (use silver searcher)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap <C-p> :FZF<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Comfortable Motion: Mouse scrolling inertia
" https://github.com/yuttie/comfortable-motion.vim
" let g:comfortable_motion_no_default_key_mappings = 1
"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
" noremap <ScrollWheelDown> j
" noremap <ScrollWheelUp> k

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
let g:ackprg = 'ag --nogroup --nocolor --column'   " Uses the silver searcher for acik

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

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

