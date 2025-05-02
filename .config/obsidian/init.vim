" UNDO / REDO: With uU
nnoremap U <C-r>

" LEADER
" Change Leader to <Space>
nnoremap <SPACE> <Nop>

let mapleader=" "
" Escape insert mode with jj
inoremap jj <Esc>

" Use visual line navigation with j/k
nnoremap j gj
nnoremap k gk

" Center screen after moving
nnoremap G Gzz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Yank to end of line like in Vim
nnoremap Y y$

" Quick clear of search highlight
nnoremap <Leader><space> :noh<CR>

" automatically shift the visual selection in visual mode
vnoremap < <gv
vnoremap > >gv
