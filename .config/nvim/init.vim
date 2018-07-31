" https://medium.com/@boiser/a-vim-poser-s-guide-to-neovim-ea79e95c31cd

call plug#begin('~/.config/nvim/plugged')

" fuzzy file search with fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" directory tree browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" full text search with silver surfer
Plug 'rking/ag.vim'

call plug#end()


nnoremap <C-p> :FZF<CR>
