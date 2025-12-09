
" Markdown
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<Enter>
autocmd Filetype markdown inoremap ,w -----------------------------------------------------------------------------<Enter>
noremap <S-m> :MarkdownPreview<CR>

" FZF
noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :MRU<CR>
noremap <C-t> :BTags<CR>
noremap <C-l> :LinesWithPreview<CR>
noremap <C-b> :Buffers<CR>
noremap q;    :History:<CR>

" stuff
noremap <S-j> 5j
noremap <S-k> 5k
noremap <S-r> <c-w><c-w>g++ stuff.cpp<CR>./a.out<CR><C-w><c-w>
noremap <S-c><S-c> :vsplit<CR>:terminal<CR><C-w>j<CR><c-w>l
noremap <S-c>l  <c-w>h<c-l><c-w>l
noremap <S-c>c  <c-w>h<c-c><c-w>l
noremap <S-t> :tabnew<CR>
noremap <S-s> :w<CR>
noremap <S-q> :q<CR>

" colemak
noremap n j
noremap e k
noremap i l

noremap f e
noremap <S-f> <S-e>
noremap l i
noremap <S-l> <S-i>
noremap k n
noremap <S-k> <S-n>

