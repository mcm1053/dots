" ~/.config/nvim/init.vim

""""""""""""""
"" Settings 
""""""""""""""
set number                " Show line numbers
set cursorline						" Show cursorline
let mapleader=" "         " Set mapleader to space
set clipboard=unnamedplus " Copy to clipboard

""""""""""""""
"" Vim Plug
""""""""""""""
call plug#begin()
Plug 'francoiscabrol/ranger.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rbgrouleff/bclose.vim'
Plug 'rhysd/vim-clang-format'
Plug 'romainl/Apprentice'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set termguicolors												     " Needed for colorscheme
colorscheme apprentice											 " Set colorscheme to apprentice
let g:airline#extensions#tabline#enabled = 1 " Show bufferline
let g:ranger_map_keys = 0										 " Remove default ranger binding
let g:autopep8_disable_show_diff=1					 " Disable diff window for autopep8
" Space+r - open ranger
map <leader>r :Ranger<CR>                    

"""""""""""""""""
"" Keybindings
"""""""""""""""""
" Alt+p - Auto-pairs toggle
" Shift+k/j - buffer next / previous
:nnoremap <S-k> :bnext<CR>
:nnoremap <S-j> :bprevious<CR>
" Space+f - format code - c/cpp/python
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" Stop auto comments - MUST BE AT EOF
autocmd FileType * set formatoptions-=cro
