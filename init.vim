" ~/.config/nvim/init.vim

" Settings
let mapleader = " "       " Map leader to space
set clipboard=unnamedplus " Use system clipboard
set cursorline            " Show the cursor line
set expandtab             " Tabs as spaces
set noshowmode            " Dont show current mode
set number                " Show line numbers

" Vim Plug
call plug#begin()
Plug 'francoiscabrol/ranger.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'rbgrouleff/bclose.vim'
Plug 'rhysd/vim-clang-format'
Plug 'romainl/Apprentice'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
call plug#end()
colorscheme apprentice             " Set colorscheme to apprentice
let g:autopep8_disable_show_diff=1 " Disable diff window for autopep8
set showtabline=2                  " Show the lightline-tabline
set termguicolors                  " Needed for colorscheme
let g:lightline = {
      \ 'colorscheme': 'apprentice',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ [''] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" Keybindings
" Alt+p - toggle autopairs
" Leader+r - open ranger
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
" Shift+k - next buffer
nnoremap <S-k> :bnext<CR>
" Shift+j - previous buffer
nnoremap <S-j> :bprevious<CR>
" Leader+f - format c/c++/python code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
autocmd FileType python nnoremap <buffer><Leader>f :call Autopep8()<CR>

" Stop auto comments - MUST BE AT EOF
autocmd FileType * set formatoptions-=cro
