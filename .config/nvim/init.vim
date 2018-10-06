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
Plug 'terryma/vim-smooth-scroll'                        " Smooth-Scrolling... maps optionally
call plug#end()


" CONFIGURATION HOWTO
" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" Search for Content in Files (ACK)
nnoremap <C-f> :Ack<Space>
if executable('ag')                                  " Have Silver Searcher?
  let g:ackprg = 'ag --vimgrep'                      " Use it
  let g:ackprg = 'ag --nogroup --nocolor --column'   " Uses the silver searcher for acik
endif

" Search for Files By Name (FZF)
nnoremap <C-p> :FZF<CR>
nnoremap <D-S-o> :FZF<CR>

" Undo / Redo
nnoremap U <C-r>

" Navigation Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Mouse scrolling inertia (Comfortable Motion)
" https://github.com/yuttie/comfortable-motion.vim
" let g:comfortable_motion_no_default_key_mappings = 1
"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
" noremap <ScrollWheelDown> j
" noremap <ScrollWheelUp> k

" Smooth Scrolling (terryma/vim-smooth-scroll)
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Mouse In Buffers
set mouse=a
map <ScrollWheelUp> <C-Y>         " Scroll one line up at a time
map <ScrollWheelDown> <C-E>      " Scroll one line down at a time

" NERDTree (C-n)
nnoremap <C-n> :NERDTreeToggle<CR> 
let g:NERDTreeMouseMode=3               " Use Mouse
let NERDTreeShowHidden=1                " Show hidden files

"" semi-colon / colon swap
""noremap ; :
""noremap : ;

" Buffer View Options
set showmatch           " Show matching brackets.
set ruler               " Show current position
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set cursorline          " Show highlight on current line
"set magic              " Set magic on, for regexps
set showmatch           " Show matching brackets when text indicator on top of one
set title               " Show the filename
set showcmd             " Show commands when entered

" Buffer Auto-Save Options
set autoread            " Automatically re-read the file when it changes on the filesystem and does not change in the buffer

" Tabbing
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
vnoremap < <gv
vnoremap > >gv

" RegEXP Search Options
"set magic              " Set magic on, for regexps
set hlsearch            " Highlight search pattern matches
set incsearch           " Make search look within strings
nnoremap n nzz          " Center searches?
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

" Startup Behavior
set shellcmdflag=-ic        " Start in interactive mode

" Arrow Keys (Disable)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

