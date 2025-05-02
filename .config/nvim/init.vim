
" CONFIGURATION HOWTO
" http://learnvimscriptthehardway.stevelosh.com
" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
" http://fisadev.github.io/fisa-vim-config/

" STARTUP
set shellcmdflag=-ic        " Start in interactive mode

" PLUGIN PROVIDERS/HOSTS: Python
" Run :checkhealth to make sure these work
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" LEADER
" Change Leader to <Space>
nnoremap <SPACE> <Nop>
let mapleader=" "

" WINDOW SPLITTING
" Default split behaviors
set nosplitbelow
set nosplitright

" ACK (Search Files by Content)
" do this before loading plugins because of the way that the plugin deals with
" autoclose.
" be sure to add .ignore file to project folder to control search paths
" shortcut LAck searchs with location list (Ack searches with Quickfix)
" ! prevents first result from opening
nnoremap <Leader>/ :Ack!<Space>
" nnoremap <Leader>/ :LAck!<Space>
" splits current window (https://github.com/mileszs/ack.vim/issues/219)
let g:ackhighlight = 1
let g:ackpreview = 1
let g:ack_apply_qmappings = 1
" let g:ack_apply_lmappings = 1
let g:ack_autoclose = 1
"let g:ack_autofold_results = 1
let g:ack_qhandler = 'copen'
" let g:ack_lhandler = 'copen'
" ACK Dispatch: this is annoying cause it causes a warning window to pop open in iterm
" let g:ack_use_dispatch = 1
" use Silver Surfer
if executable('ag')                                  " Have Silver Searcher?
  let g:ackprg = 'ag --nogroup --nocolor --column'   " Uses the silver searcher for acik
endif

" Run :PlugInstall from inside NeoVim
call plug#begin('~/.config/nvim/plugged')
" Plug '/usr/local/opt/fzf'                               " fzf fuzzy search with fzf
Plug 'avakhov/vim-yaml'                                 " VIM yaml formatter
Plug 'Chiel92/vim-autoformat'                           " Code autoformatting
" Plug 'christoomey/vim-tmux-navigator'                   " Use same shortcuts for tmux and vim pane navigation
Plug 'easymotion/vim-easymotion'                        " Easymotion navigation
Plug 'ekalinin/Dockerfile.vim'                          " Syntax highlighting for Dockerfiles
" Plug 'fatih/vim-go'                                     " Go development plugin for Vim
Plug 'gcmt/taboo.vim'                                   " Ease the way you set the vim tabline
Plug 'groenewege/vim-less'                              " Syntax highlighting for less files
Plug 'haya14busa/vim-operator-flashy'                   " Flash on yank
Plug 'janko-m/vim-test'                                 " Test.vim framework
Plug 'jkassis/vim-chrome-devtools', { 'do': 'npm install && npm run build' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " fzf fuzzy search with fzf
Plug 'junegunn/fzf.vim'                                 " fzf fuzzy search
Plug 'kana/vim-operator-user'                           " Easy API for making new operators
" Plug 'ludovicchabant/vim-gutentags'                     " Gutentags
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }      " Tag based file outlines
Plug 'mileszs/ack.vim'                                  " ACK full-text searching with quickfix window
Plug 'moll/vim-bbye'                                    " Clear out buffers with \q shortcut without blowing up windows
Plug 'neovim/node-host'                                 " Node provider
Plug 'pangloss/vim-javascript'                          " Syntax highlighting and improved indentation.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " directory tree browser
Plug 'scrooloose/syntastic'                             " Integration for external syntax checkers.
Plug 'sidoraras/node-vim-debugger'
" Plug 'scrooloose/nerdcommenter'                        " Code commenting
Plug 'skywind3000/vim-preview'                          " advanced preview window management
" Plug 'tbastos/vim-lua'                                  " Improved Lua 5.3 syntax and indentation support for Vim
" Plug 'terryma/vim-smooth-scroll'                        " Smooth-Scrolling... maps optionally
Plug 'tpope/vim-commentary'                             " Code commenting
Plug 'tpope/vim-dispatch'                               " Asynchronous job adapters
Plug 'tpope/vim-fugitive'                               " Git integration for vim
Plug 'tpope/vim-surround'                               " easily delete, change, and add surroundings in pairs.
Plug 'tpope/vim-unimpaired'                             " Paired bracket maps for navigation and more
Plug 'tyok/nerdtree-ack', { 'on': 'NERDTreeToggle' }    " search menu option for NERDTRee
" Plug 'vim-vdebug/vdebug'                                " DBGP debugger
Plug 'vim-airline/vim-airline'                          " Lightweight statusline (since powerline is deprecated)
"Plug 'yuttie/comfortable-motion.vim'                   " Smooth, inertial scrolling
Plug 'ryanoasis/vim-devicons'                           " Fancy icons compatible with certain plugins
Plug 'vim-scripts/ReplaceWithRegister'                  " Enables 'gr' command to replace with a register (better than change or paste)
call plug#end()


" JUMP LIST: Flip navigation
nnoremap <C-o> <C-i>
nnoremap <C-i> <C-o>

" UNDO / REDO: With uU
nnoremap U <C-r>

" TAGS
" http://vim.wikia.com/wiki/Browsing_programs_with_tags
" disable gutentags during gitcommit gitrebase
nnoremap <Leader>t :TagbarToggle<CR>
au FileType gitcommit,gitrebase let g:gutentags_enabled=0

" QUICKFIX WINDOW
" Open at bottom of screen with full-width
" :autocmd FileType qf wincmd J
" botright cwindow
" vert cwindow
" p to Open Preview Window
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
" P to Close Preview Window
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
" Automatically close the preview window when quickfix closes
" autocmd BufDelete <buffer> if &buftype == 'quickfix' | :pc! | endif     " Never Worked
" autocmd FileType qf autocmd BufDelete <buffer> echom "Hey"              " Console Log Example
autocmd FileType qf autocmd BufDelete <buffer> :pc!


" auto update windows when switching back to vim
autocmd FocusGained,BufEnter * checktime


" FZF (Search Files by Name)

" WINDOWS : Navigation
nnoremap <Leader>h <C-w>h
nnoremap <C-h> <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <C-j> <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <C-k> <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <C-l> <C-w>l

" WINDOWS : Rearrangement
" alt-key combinations inserted by typing combo in insert mode
nnoremap ˙ <C-w>H
nnoremap ∆ <C-w>J
nnoremap ˚ <C-w>K
nnoremap ¬ <C-w>L

" WINDOWS : Closing
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" BUFFERS: Open New (Using junegunn/fzf)
let g:fzf_layout = { 'window': 'enew' }
nnoremap <Leader>e :FZF --multi<CR>
nnoremap <Leader>p :FZF --multi<CR>
" BUFFERS: Save / Write
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :w!<CR>
" BUFFERS: Close
nnoremap <Leader>w :Bdelete!<CR>
nnoremap <Leader>W :bufdo :Bdelete<CR>

" BUFFERS: Switch by number
nnoremap <Leader>b :ls<CR>:b<SPACE>

" BUFFERS: Switch left / right
nnoremap <Leader>H :bp<CR>
nnoremap <Leader>L :bn<CR>


" BUFFERS: Auto-Save / Read Options
set autoread            " Automatically re-read the file when it changes on the filesystem and does not change in the buffer

" TABS: Navigation
nnoremap <Leader>u :tabfirst<CR>
nnoremap <Leader>i :tabp<CR>
nnoremap <Leader>o :tabn<CR>
"nnoremap <Leader>p :tablast<CR>

" TABS: Organization
let g:taboo_renamed_tab_format = ' %l '
nnoremap <Leader>te :tabe %<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tr :TabooRename
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>U :tabm 0<CR>
nnoremap <Leader>I :tabm -1<CR>
nnoremap <Leader>O :tabm +1<CR>
nnoremap <Leader>P :tabm<CR>


" nnoremap <Leader>ii :tabm
" nnoremap <C-Left> gT
" nnoremap <C-Right> gt
" nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" MOUSE : Activate it
set mouse=a

" MOUSE : Scroll one line at a time
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" MOUSE: Alt-Mouse Drag for Visual Block Selection (Not-Working)
" http://vim.wikia.com/wiki/Use_Alt-Mouse_to_select_blockwise
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>
noremap <S-RightMouse> <LeftMouse><Esc><C-V>
noremap <S-RightDrag> <LeftDrag>

" MOUSE: Scrolling inertia with Comfortable Motion
" https://github.com/yuttie/comfortable-motion.vim
" let g:comfortable_motion_no_default_key_mappings = 1
" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
" noremap <ScrollWheelDown> j
" noremap <ScrollWheelUp> k

" MOUSE: Smooth Scrolling (terryma/vim-smooth-scroll)
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" NERDTree
"nnoremap <C-n> :NERDTreeToggle<CR>
function! NERDTreeToggleOrFind()
    if !exists('g:NERDTree')
      exec ":NERDTreeToggle"
    elseif !g:NERDTree.IsOpen()
      exec ":NERDTreeToggle"
    else
      exec ":NERDTreeFind"
    endif
endfunction
command! NERDTreeToggleOrFind :call NERDTreeToggleOrFind()<CR>
nnoremap <Leader>g :NERDTreeToggleOrFind<CR>
let g:NERDTreeMouseMode=3               " Use Mouse
let NERDTreeShowHidden=1                " Show hidden files
" Highlight currently open buffer in NERDTree
"autocmd BufEnter * :NERDTreeFind<CR>

" REGISTERS: Use System Clipboard as Default / Unnamed Register
" Generally on Linux, + and  * are different: + corresponds to the desktop clipboard (XA_SECONDARY) that is accessed using CTRL-C, CTRL-X, and CTRL-V, while * corresponds to the X11 primary selection (XA_PRIMARY), which stores the mouse selection and is pasted using the middle mouse button in most applications.
" set clipboard=unnamed
set clipboard=unnamedplus
nnoremap <Leader>c "+y
nnoremap <Leader>v "+p
nnoremap <Leader>V "+P
nnoremap Y y$

" REGISTERS: Flashy Yank
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" REGISTERS: Rotation
" http://vim.wikia.com/wiki/Comfortable_handling_of_registers
" https://stackoverflow.com/questions/54255/in-vim-is-there-a-way-to-delete-without-putting-text-in-the-register
" nnoremap <Leader>s :let @a=@" \| let @"=@+ \| let @+=@a<CR>

" CURSOR: Visual Cues
set showmatch           " Show matching brackets when text indicator on top of one
set cursorline          " Show highlight on current line

" STATUS BAR / TITLE BAR
set ruler               " Show current position
set notitle               " Set the title of the screen (iterm tab)
set showcmd             " Show commands when entered

" LINE NUMBERS: Standard Line Numbering
" :set number

" LINE NUMBERS: Hybrid Line Numbering
" https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" FORMATTING: Tabbing and Shifting
" tabstop       Num columns to render per tab character.
" softtabstop   Just set this to tabstop for sanity.
" shiftwidth    Num spaces to shift for shift commands ('<' and '>')
" expandtab     Always insert spaces for TAB key (when set).
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au! FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" automatically shift the visual selection in visual mode
vnoremap < <gv
vnoremap > >gv

" FORMATTING: Autoformat
noremap <Leader>f :Autoformat<CR>

" FORMATTING: COMMENTS
set formatoptions+=o    " Continue comment marker in new lines.

" INTRA-FILE TEXT SEARCH: Visual Mode Selection Searches
" See http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>"<CR>
"vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap /? y/\V<C-R>"<CR>

" SEARCH: Formatting
"set magic              " Set magic on, for regexps
set hlsearch            " Highlight search pattern matches

" SEARCH: Matching Behavior
set incsearch           " Make search look within strings
set ignorecase          " Required for smartcase to work
set smartcase           " Do case-sensitive search when target includes capitals

" SEARCH: Goto next and prev centers the screen
nnoremap n nzz
nnoremap N Nzz

" SEARCH: Shortcut for global search and replace
nnoremap <C-/> :%s/

" Arrow Keys (Disable)
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" Removed in favor of vim-unimpaired
"" Vertical Whitespace Shortcuts
"" http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines<Paste>
"" noremap <C-l> :call append(line('.')-1, '')
"" noremap <C-L> :call append(line('.')+1, '')
"noremap <Up> mZO<Esc>`Z
"noremap <S-Up> m`:-g/^\s*$\n/d<CR>'`:noh<CR>
"noremap <Down> mZo<Esc>`Z
"noremap <S-Down> m`:+g/^\s*$\n/d<CR>'`:noh<CR>
"
"noremap <C-BS> mZO<Esc>`Z
"noremap <BS> mZ:-1,-1s/^\s*$\n//<CR>:noh<CR>`Z
"noremap <Space> mZo<Esc>`Z
"noremap <C-Space> mZ:+1,+1s/^\s*$\n//<CR>:noh<CR>`Z

" THEME: Syntax Highlighting
syntax enable           " enable syntax color schemes without overwriting existing highlighting rules

" THEME: Colors
set t_Co=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
" colorscheme solarized

" THEME: Fonts
set encoding=utf8
" guifont (aka gfn)
" set guifont=Hack\ Nerd\ Font:h12
" set guifont=Hack\ Nerd\ Font:h13
" set guifont=Fira\ Code:h12
" set guifont=DroidSansMono_Nerd_Font:h11
" set guifont=Bitstream\ Vera\ Sans\ Mono:h10
" set guifont=Hack\ Nerd\ Font:h12
" set guifont=Hack\ Nerd\ Font:h13
" set guifont=Fira\ Code:h12
" set guifont=DroidSansMono\ Nerd\ Font:h11

" FILE FORMATS
set ffs=unix,dos,mac

" COMMAND LINE: Wildmenu
" See http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmenu
set wildmode=longest:full,full

" MOTIONS: EasyMotion
" https://github.com/easymotion/vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

" TERMINAL MODE
" Use esc to exit
:tnoremap <Esc> <C-\><C-n>

" SORT A COMMA-SEPARATED LIST
:vnoremap µ '<,'>s/\%V.*\%V\@!/\=join(sort(split(submatch(0), '\s*,\s*')), ', ')
