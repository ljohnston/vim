
" TODO:
" - grep (for text):
"   - what command?
"   - when searching, it searches in found text. I want to search filenames.
"

if executable('ag')
    call denite#custom#var('file/rec', 'command', 
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']) 

    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])

elseif executable('rg')
    call denite#custom#var('file/rec', 'command', 
        \ ['rg', '--files', '--glob', '!.git'])

    call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
endif

call denite#custom#source('file/rec', 'matchers', ['matcher/regexp'])

call denite#custom#source('grep',
      \ 'converters', ['converter/abbr_word'])

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-f>',
      \ '<denite:scroll_page_forwards>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-b>',
      \ '<denite:scroll_page_backwards>',
      \ 'noremap'
      \)

nnoremap <leader>f :<C-u>Denite file     -highlight-mode-insert=Search -direction=dynamictop<cr>
nnoremap <leader>r :<C-u>Denite file/rec -highlight-mode-insert=Search -direction=dynamictop<cr>
nnoremap <leader>R :<C-u>Denite grep     -highlight-mode-insert=Search -direction=dynamictop<cr>

nnoremap <leader>p :<C-u>DeniteProjectDir file/rec -highlight-mode-insert=Search -direction=dynamictop<cr>
nnoremap <leader>P :<C-u>DeniteProjectDir grep     -highlight-mode-insert=Search -direction=dynamictop<cr>
" nnoremap <leader>y :Unite history/yank<CR>

