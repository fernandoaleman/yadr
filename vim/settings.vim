let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor

" Vim navigation panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nerdtree toggle
" autocmd VimEnter * NERDTree     " always open at startup
let NERDTreeShowHidden=1          " always show hidden files
let NERDTreeIgnore = ['\.git[[dir]]', '\.sass-cache[[dir]]', '\.DS_Store', '\.swp', '\.ruby-gemset', '\.idea']
nnoremap <leader>d :NERDTreeToggle<CR>

" Set relativenumber
set relativenumber

" Auto wrap git commits at 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

" Vim git gutter
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 0 " Turn off git gutter by default

" Switch to last file
nnoremap <leader><leader>a <c-^>
