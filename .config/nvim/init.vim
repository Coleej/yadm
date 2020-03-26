" << vimrc >> {{{

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vim/vimrc

nnoremap <silent> <leader>eov :split ~/.vim/vimrc<cr>
nnoremap <silent> <leader>vov :vsplit ~/.vim/vimrc<cr>

" << config >> {{{

set shell=/usr/bin/fish

" }}}

" << coc recommendations >> {{{

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


" << completion >> {{{

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" }}}

" << mappings >> {{{

" snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> U :call <SID>show_documentation()<CR>

" show documentation (or vim help if already in a vim or help
" filetype)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    silent! execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>cA  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>cx  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <silent> <space>p :<C-u>CocListResume<cr>

" Open the Coc-Config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" }}}

" << autocmds >> {{{

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" }}}

" << highlight >> {{{


" }}}


" }}}

" << terminal-mode maps>> {{{

tnoremap <C-W>N <C-\><C-n>
tnoremap ]g <C-\><C-N>:tabn<cr>
tnoremap [g <C-\><C-N>:tabp<cr>
tnoremap ]b <C-\><C-N>:bnext<cr>
tnoremap [b <C-\><C-N>:bprev<cr>
tnoremap <C-l>l <C-\><C-n>:wincmd l<cr>
tnoremap <C-h> <C-\><C-n>:wincmd h<cr>
tnoremap <C-k> <C-\><C-n>:wincmd k<cr>
tnoremap <C-j> <C-\><C-n>:wincmd j<cr>

nnoremap <silent> <leader>t :execute "bel 15split term://fish"<cr>
nnoremap <silent> <leader>vt :execute "vsplit term://fish"<cr>


" }}}

" << autocmds >> {{{

" << terminal >> {{{

au TermOpen * startinsert
au BufEnter term://* startinsert
au TermClose * bd!

" }}}

" <<< tex >>> {{{

augroup filetype_tex
	au Filetype tex let g:vimtex_compiler_progname = 'nvr'
augroup END

" }}}

" << JSON >> {{{

augroup filetype_json
	" change comments for jsonc
	au FileType json syntax match Comment +\/\/.\+$+
augroup END

" }}}

" }}}

" vim: set foldmethod=marker
