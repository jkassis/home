" https://medium.com/@boiser/a-vim-poser-s-guide-to-neovim-ea79e95c31cd

call plug#begin('~/.config/nvim/plugged')

" fuzzy file search with fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'avakhov/vim-yaml'

" directory tree browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" full text search with silver surfer
Plug 'rking/ag.vim'

call plug#end()

" Run :PlugInstall from inside NeoVim

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
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

" Find file with command shift o
nnoremap <D-S-o> :FZF<CR>
