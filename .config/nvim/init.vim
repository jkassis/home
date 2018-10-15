" CONFIGURATION HOWTO
" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" Startup Behavior
set shellcmdflag=-ic        " Start in interactive mode

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

" Search for Content (ACK) in Files with Silver Surfer 
nnoremap <C-f> :Ack<Space>
if executable('ag')                                  " Have Silver Searcher?
  let g:ackprg = 'ag --vimgrep'                      " Use it
  let g:ackprg = 'ag --nogroup --nocolor --column'   " Uses the silver searcher for acik
endif

" Search for Files By Name (FZF)
nnoremap <C-p> :FZF<CR>
nnoremap <D-S-o> :FZF<CR>

" Undo / Redo with uU
nnoremap U <C-r>

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab Navigation
nnoremap <C-Left> gT
nnoremap <C-Right> gt
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Mouse Activated
set mouse=a
map <ScrollWheelUp> <C-Y>         " Scroll one line up at a time
map <ScrollWheelDown> <C-E>       " Scroll one line down at a time

" Alt-Mouse Drag for Visual Block Selection
" Not-Working
" http://vim.wikia.com/wiki/Use_Alt-Mouse_to_select_blockwise
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>

noremap <S-RightMouse> <LeftMouse><Esc><C-V>
noremap <S-RightDrag> <LeftDrag>

" Mouse scrolling inertia (Comfortable Motion)
" https://github.com/yuttie/comfortable-motion.vim
" let g:comfortable_motion_no_default_key_mappings = 1
" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
" noremap <ScrollWheelDown> j
" noremap <ScrollWheelUp> k

" Smooth Scrolling (terryma/vim-smooth-scroll)
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" NERDTree (C-n)
nnoremap <C-n> :NERDTreeToggle<CR> 
let g:NERDTreeMouseMode=3               " Use Mouse
let NERDTreeShowHidden=1                " Show hidden files

" Commenting
set formatoptions+=o    " Continue comment marker in new lines.

" Cursor Cues
set showmatch           " Show matching brackets when text indicator on top of one
set cursorline          " Show highlight on current line

" Status Bar / Title Bar
set ruler               " Show current position
set title               " Show the filename
set showcmd             " Show commands when entered

" Standard Line Numbering
" :set number

" Hybrid Line Numbering
" https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Buffer Auto-Save / Read Options
set autoread            " Automatically re-read the file when it changes on the filesystem and does not change in the buffer

" Tabbing and Shifting
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
vnoremap < <gv
vnoremap > >gv

" RegEXP Search Options
"set magic              " Set magic on, for regexps
set hlsearch            " Highlight search pattern matches
set incsearch           " Make search look within strings
" Goto next and prev regexp and center the screen on the match
nnoremap n nzz
nnoremap N Nzz 
" Shortcut for global search and replace
nnoremap <C-/> :%s/

" Visual Mode Selection Searches
" See http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap /? y/\V<C-R>"<CR>      

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

" File Formats
set ffs=unix,dos,mac

" Wildmenu (http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse)
set wildmenu
set wildmode=longest:full,full

" Arrow Keys (Disable)
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" Vertical Whitespace Shortcuts
" http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines<Paste>
" noremap <C-l> :call append(line('.')-1, '')
" noremap <C-L> :call append(line('.')+1, '') 
noremap <Up> mZO<Esc>`Z
noremap <S-Up> m`:-g/^\s*$\n/d<CR>'`:noh<CR>
noremap <Down> mZo<Esc>`Z
noremap <S-Down> m`:+g/^\s*$\n/d<CR>'`:noh<CR> 
"
"noremap <C-BS> mZO<Esc>`Z
"noremap <BS> mZ:-1,-1s/^\s*$\n//<CR>:noh<CR>`Z
"noremap <Space> mZo<Esc>`Z
"noremap <C-Space> mZ:+1,+1s/^\s*$\n//<CR>:noh<CR>`Z
