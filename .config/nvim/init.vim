" << init >> {{{ 
silent mkspell! ~/.vim/spell/en.utf-8.add
" }}}

" << vim-plug >>  {{{

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * silent! PlugInstall
endif

silent! if plug#begin('~/.config/nvim/plugged')

	" UI {{{
	
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'}
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
	
	" }}}

	" asthetic {{{
	
	Plug 'breuckelen/vim-resize'
	Plug 'jszakmeister/vim-togglecursor'
  Plug 'KabbAmine/vullScreen.vim'
	Plug 'flazz/vim-colorschemes'
	Plug 'vim-scripts/AfterColors.vim'
	Plug 'powerman/vim-plugin-AnsiEsc'
	
	" }}}

	" functionality {{{
	
	"	Plug 'tbabej/taskwiki'
	Plug 'chrisbra/csv.vim'
  Plug 'Townk/vim-autoclose'
	Plug 'nelstrom/vim-visual-star-search'
  Plug 'xolox/vim-misc'
	Plug 'milkypostman/vim-togglelist'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
	
	" }}}

	" utils {{{
	
	Plug 'junegunn/vim-plug'
	Plug 'rbong/vim-flog'
" 	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'w0rp/ale'
	Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': 'bash ~/.config/fzf/install --all --xdg --no-bash --no-zsh' }
	Plug 'junegunn/fzf.vim'
	Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" }}}

	" latex {{{
	
	let dum = system("which latex")
	if v:shell_error == 0
		Plug 'lervag/vimtex'
	endif
	
	" }}}

	" python {{{
	
	Plug 'psf/black', { 'branch': 'stable' }
	Plug 'tmhedberg/SimpylFold'
	Plug 'jmcantrell/vim-virtualenv'
	
	" }}}

	" syntax highlighting {{{
	
	Plug 'leafgarland/typescript-vim'
  Plug 'dag/vim-fish'
	Plug 'glench/Vim-Jinja2-Syntax'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	
	" }}}

call plug#end()
endif

" }}}

" << editor key mappings >> {{{

let mapleader=";"
let maplocalleader="\'"

" command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" timestamps
nnoremap <silent> <s-f5> "=strftime("%c")<cr>P
inoremap <silent> <s-f5> <C-R>=strftime("%c")<cr>

nnoremap <silent> <f5> "=strftime("%d %b %Y")<cr>P
inoremap <silent> <f5> <C-R>=strftime("%d %b %Y")<cr> 

" toggles
set pastetoggle=<f6>  
nnoremap <silent> <leader>D :NERDTreeToggle<CR>

" float scrolls
nnoremap <nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-p>"
nnoremap <nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-n>"
inoremap <nowait><expr> <C-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" search and replace
nnoremap & :&&<cr>
xnoremap & :&&<cr>

" code formatter
nnoremap <F9> :CocCommand python.sortImports<CR> :Black<CR>

" spell
set spellsuggest=fast,20

" << terminal key mappings >> {{{

if has('terminal')
	set termwinkey=<C-W>
	
	nnoremap <silent> <leader>t :execute "bel term ++rows=15 ++close fish -i --init-command=" . getcwd()<cr>
	nnoremap <silent> <leader>vt :execute "vert term ++close fish -i --init-command=" . getcwd()<cr>

	tnoremap ]g <C-W>:tabn<cr>
	tnoremap [g <C-W>:tabp<cr>
	tnoremap ]b <C-W>:bnext<cr>
	tnoremap [b <C-W>:bprev<cr>
	tnoremap <C-l>l <C-W><C-l>
	tnoremap <C-h> <C-W><C-h>
	tnoremap <C-k> <C-W><C-k>
	tnoremap <C-j> <C-W><C-j>
endif

" }}}

" << buffers >> {{{

" cycle 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :last<CR>

" }}}

" << tabs >> {{{

" cycle 
nnoremap <silent> [g :tabp<CR>
nnoremap <silent> ]g :tabn<CR>
nnoremap <silent> [G :tabl<CR>
nnoremap <silent> ]G :tabfir<CR>

" }}}

" << windows >> {{{
" change window
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-l> :wincmd l<CR>

" swap two windows horizontal and verical, respectively
nmap <silent> <leader>hw <C-w>t<C-w>K
nmap <silent> <leader>vw <C-w>t<C-w>H

" close preview window
nnoremap <silent> <leader>gk :pc!<cr>

" }}}

" << movement >> {{{

" disable arrow keys
noremap <Left> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>

" move cursor to beginning and end of line
noremap H 0
noremap L $

" page-up and page-down
nnoremap J <c-f>
nnoremap K <c-b>

"}}}

" map escape 
"inoremap jk <esc>
inoremap ;; <esc>
inoremap <esc> <nop>
"noremap jk <esc>
vnoremap ;; <esc>
vnoremap <esc> <nop>

" searching
noremap <leader>n nzz
noremap <leader>N Nzz

" Open split to edit vimrc
nnoremap <silent> <leader>ev :split $MYVIMRC<cr>
nnoremap <silent> <leader>vv :vsplit $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> :echo "vimrc sourced"<cr>

" edit redpen conf
nnoremap <leader>er :split $HOME/.local/opt/redpen-distribution-1.10.3/conf/redpen-conf-en.xml<cr>
nnoremap <leader>vr :vsplit $HOME/.local/opt/redpen-distribution-1.10.3/conf/redpen-conf-en.xml<cr>

" Help
nnoremap <leader>vh :vert help<cr>

" redraw the window and disable hl
nnoremap <silent> <c-d> :<c-u>nohlsearch<cr><c-l>

" Coding bindings
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap b /return<cr>

" operator Mappings"
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap il( :<c-u>normal! F)vi(<cr>

" }}}

" << config >> {{{

set formatoptions+=j
set nocompatible
set shell=/bin/bash
set hlsearch
set foldmethod=syntax
set incsearch
silent! set belloff=all
set smartcase
set hidden
set wrap linebreak
set grepprg=grep\ -nH\ $ "Set grep to always print file-names*
set autoindent
set ts=2
set sw=2
set wildmenu
set wildmode=full
set history=200
set diffopt+=vertical,indent-heuristic
filetype plugin indent on
syntax on
noh
setlocal nolist
set listchars=tab:>-,eol:¬,trail:⋅

augroup CloseLoclistWindowGroup
	autocmd!
	autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

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
nmap <leader>cn <Plug>(coc-rename)

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

hi CocInfoSign 	cterm=bold ctermfg=21
hi CocHintSign	cterm=bold ctermfg=14

" }}}


" }}}

" << terminal-mode maps>> {{{

tnoremap <C-W>n <C-\><C-n>
tnoremap ]g <C-\><C-N>:tabn<cr>
tnoremap [g <C-\><C-N>:tabp<cr>
tnoremap ]b <C-\><C-N>:bnext<cr>
tnoremap [b <C-\><C-N>:bprev<cr>
tnoremap <C-l>l <C-\><C-n>:wincmd l<cr>
tnoremap <C-h> <C-\><C-n>:wincmd h<cr>
tnoremap <C-k> <C-\><C-n>:wincmd k<cr>
tnoremap <C-j> <C-\><C-n>:wincmd j<cr>

" paste in insert mode and don't clobber fzf <Ctrl-R> search
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

nnoremap <silent> <leader>t :execute "bel 15split term://fish"<cr>
nnoremap <silent> <leader>vt :execute "vsplit term://fish"<cr>

" }}}

"  << plugin configs >> {{{

" << fugitive >> {{{

nnoremap <leader>gc :Git commit -a<cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gl :Git pull<cr>

" }}}

" << vim-resize >> {{{

nnoremap <silent> <c-left> :CmdResizeLeft<cr>
nnoremap <silent> <c-down> :CmdResizeDown<cr>
nnoremap <silent> <c-up> :CmdResizeUp<cr>
nnoremap <silent> <c-right> :CmdResizeRight<cr>

" }}}

" << UltiSnips >> {{{

"let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsExpandTrigger = '<c-o>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
"let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
"let g:UltiSnipsEditSplit="context"

"let g:ultisnips_javascript = {
"	\ 'keyword-spacing': 'always',
"	\ 'semi': 'always',
"	\ 'space-before-function-paren': 'always'
"\}

" }}}

" << AutoClose >>  {{{

let g:AutoClosePairs_add = "$ % <>"

" }}}

" << vim-airline >> {{{

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'

" }}}

" << fzf >> {{{

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

nnoremap <leader>F :FZF<cr>

" }}}

" << ALE >> {{{

let g:ale_linters = {
	\ 'python': ['black', 'flake8'],
	\ 'javascript': ['eslint', 'tsserver', 'prettier'],
	\ 'typescript': ['eslint', 'tsserver'],
	\ 'css': ['prettier'],
	\ 'html': ['prettier'],
	\ 'tex': ['chktex','lacheck'],
	\ 'vimwiki': []
\}

let g:ale_fixers = {
	\ 'python': ['black',
	\            'isort',
	\						 'add_blank_lines_for_python_control_statements',
	\						 'trim_whitespace'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'typescript': ['eslint', 'prettier'],
	\ 'css': ['prettier'],
	\ 'html': ['prettier'],
	\ 'tex': ['latexindent',
	\					'remove_trailing_lines',
	\					'trim_whitespace'],
	\ 'sh': ['shfmt', 'trim_whitespace'],
	\ 'fish': ['remove_trailing_lines', 'trim_whitespace']
\}

" python
let g:ale_python_black_use_global = 1
let g:ale_python_isort_use_global = 1

" interesting options (set to default)
let g:ale_cursor_detail = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 0

nmap <leader>ah <Plug>(ale_hover)
nmap <leader>af <Plug>(ale_fix)
nmap <leader>ad <Plug>(ale_go_to_definition)

" }}}

" << vim-ob(pro)session >> {{{

nnoremap <leader>S :Obsession<cr> 
nnoremap <leader>O :Obsession<cr>
nnoremap <leader>p :call fzf#run({'source': prosession#ListSessions(), 'sink': 'Prosession', 'down': '30%'})<cr>


" }}}

" << NERDTree >> {{{

let g:NERDTreeWinSize = 52
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" function to open NERDTree depending on filetype
"au vimenter * call s:CheckToOpenNERDTree()

function! s:CheckToOpenNERDTree() abort

	" Open for python
	if &filetype == 'python'
		NERDTree
	endif

	" Open for c
	if &filetype == 'c'
		NERDTree
	endif

endfunction

" user NERDTree when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "?"
    \ }


" }}}

" << vimwiki >> {{{
let g:vimwiki_key_mappings =
	\ {
  \		'table_mappings': 0
	\ }

"<Plug>VimwikiNextLink
"<Plug>VimwikiPrevLink
let g:vimwiki_folding='syntax'

let wiki_root = {}
let wiki_root.path = '~/Nextcloud/vimwiki'
let wiki_root.path_html = '~/Nextcloud/vimwiki/html'
let wiki_root.template_path = '~/Nextcloud/vimwiki/templates/'
let wiki_root.template_default = 'def_template'
let wiki_root.template_ext = '.html'

let wiki_phd = {}
let wiki_phd.path = '~/Nextcloud/phd_wiki'
let wiki_phd.path_html = '~/Nextcloud/phd_wiki/html'
let wiki_phd.template_path = '~/Nextcloud/phd_wiki/templates/'
let wiki_phd.template_default = 'def_template'
let wiki_phd.template_ext = '.html'

let wiki_erdc = {}
let wiki_erdc.path = '~/Nextcloud/erdc_wiki'
let wiki_erdc.path_html = '~/Nextcloud/erdc_wiki/html'
let wiki_erdc.template_path = '~/Nextcloud/erdc_wiki/templates/'
let wiki_erdc.template_default = 'def_template'
let wiki_erdc.template_ext = '.html'

let g:vimwiki_list = [wiki_root, wiki_phd, wiki_erdc]

" << external link (vfile) handler   {{{

function! VimwikiLinkHandler(link)
	let link = a:link
	if link =~# '^vfile:'
		let link = link[1:]
	else
		return 0
	endif
	let link_infos = vimwiki#base#resolve_link(link)
	if link_infos.filename == ''
		echomsg 'Vimwiki Error: Unable to resolve link!'
		return 0
	else
		exe 'tabnew ' . fnameescape(link_infos.filename)
		return 1
	endif
endfunction

" }}}

" }}}

" << vimtex >> {{{

let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:tex_flavor = 'latex'

let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 3

let g:vimtex_quickfix_ignore_filters = [
			\ 'overfull',
			\ 'underfull',
			\ 'Marginpar on page',
			\ '.*float specifier changed.*',
			\ '.*caption.*'
\]

let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : './build'
	\}

let g:vimtex_fold_enabled=0
let g:vimtex_fold_levelmarker='◊'

" }}}

" }}}

"  << abbreviations >> {{{

:iabbrev adn and
:iabbrev waht what
:iabbrev tehn then
:iabbrev strom storm
:iabbrev @@1 codyjohnson144@gmail.com
:iabbrev @@2 cjoh296@lsu.edu

" }}}

" << autocmds >> {{{

if has("autocmd")
  " Enable file type detection
  filetype on 

  " python autocmd group ------------------------------------------- {{{
  :augroup filetype_python
    :autocmd!
		:au BufWritePre *.py call FormatPython()
"		:au BufWritePre *.py execute ':Black'
"		:au BufWritePre *.py execute ':CocCommand python.sortImports'
		:au FileType vimwiki let maplocalleader="\'"
		:au Filetype python setlocal tabstop=4
		:au Filetype python setlocal softtabstop=4
		:au Filetype python setlocal shiftwidth=4
		:au Filetype python setlocal textwidth=0
		:au Filetype python setlocal expandtab
		:au Filetype python setlocal nu
		:au Filetype python setlocal fileformat=unix
		:au FileType python setlocal foldmethod=indent
		:au FileType python setlocal completeopt-=preview
		:au FileType python let g:SimpylFold_docstring_preview = 1

		" jedi bindings "
"		:au FileType python let g:jedi#documentation_command = "U"
"		:au FileType python let g:jedi#goto_command = "<localleader>d"
"		:au FileType python let g:jedi#goto_assignments_command = "<localleader>g"
"		:au FileType python let g:jedi#usages_command = "<localleader>n"

  :augroup END
	" }}}
  
  " (ba)sh autocmd group ----------------------------------------------- {{{
  :augroup filetype_sh
    :autocmd!
    :au FileType sh setlocal tabstop=2
    :au FileType sh setlocal sw=2
  :augroup END
	" }}}
  
  " << tex >> --------------------------------------------------------- {{{

  augroup filetype_tex
    autocmd!

		au Filetype tex let g:vimtex_compiler_progname = 'nvr'
    au FileType tex setlocal ts=2
    au FileType tex setlocal sts=2
    au FileType tex setlocal sw=2
		au FileType tex setlocal spell spelllang=en_us
		au FileType tex setlocal nonu
		au FileType tex setlocal foldmethod=expr
		au FileType tex setlocal foldexpr=vimtex#fold#level(v:lnum)
		au FileType tex setlocal foldtext=vimtex#fold#text()
		au FileType tex nnoremap <buffer> <localleader>cf :call vimtex#fzf#run()<cr>
		au FileType tex nnoremap <buffer> <localleader>lh <plug>(vimtex-compile-ss)
		au FileType tex nnoremap <buffer> <localleader>lss <plug>(vimtex-compile-selected)
    au FileType tex nnoremap <buffer> <localleader>la <plug>(vimtex-lacheck)
    au FileType tex nnoremap <buffer> U :VimtexDocPackage<cr>
		au FileType tex nnoremap <buffer> <localleader>ts i\textsuperscript{}<esc>i
		au FileType tex inoremap <buffer> <localleader>ts \textsuperscript{}<esc>i

		" custom ToC for vimtex
		au FileType tex call CreateTocs()

		" manuscript editting
		au FileType tex let b:surround_99 = "{\\color{red}\\sout{ \r }}"
		au FileType tex let b:surround_97 = "{\\color{green} \r }"
		
		" paste/insert in red strikeout text
		au FileType tex nnoremap <buffer> <localleader>pc :<c-u>normal i{\color{red}\sout{ ;;P<cr>
		au FileType tex nnoremap <buffer> <localleader>ic :<c-u>normal i{\color{red}\sout{  <cr>
		
  :augroup END
	" }}}
  
  " C autocmd group ------------------------------------------- {{{
  :augroup filetype_c
    :autocmd!
		:au FileType vimwiki let maplocalleader="\'"
    :au FileType c nnoremap <silent> <buffer> <localleader>c I//<esc>
    :au FileType c setlocal ts=2 sts=2 sw=2 expandtab
  :augroup END
	" }}}

  " text autocmd group ---------------------------------------- {{{
  :augroup filetype_text
    :autocmd! 
    :au FileType text setlocal nolist
    :au FileType text setlocal nonu
  :augroup END
	" }}}

  " wiki autocmd group ------------------------------------------ {{{
  :augroup filetype_vimwiki
    :autocmd!

    " options
		:au FileType vimwiki let maplocalleader="\'"
    :au FileType vimwiki setlocal spell spelllang=en_us
    :au FileType vimwiki setlocal sw=3
    :au FileType vimwiki setlocal ts=3
    :au FileType vimwiki setlocal nolist
    :au FileType vimwiki setlocal nonu
    :au FileType vimwiki let b:autopairs_enabled = 0

    " type settings mappings
    :au FileType vimwiki noremap <buffer> <localleader>R :VimwikiRenameLink<CR>
    :au FileType vimwiki noremap <silent> <buffer> <localleader>b bi*<esc>ea*<esc>e
    :au FileType vimwiki noremap <silent> <buffer> <localleader>i bi_<esc>ea_<esc>e

		" rendering HTML
		:au FileType vimwiki noremap <buffer> <localleader>ht :Vimwiki2HTMLBrowse<CR>

    " plugin function mappings
    :au FileType vimwiki noremap <buffer> <localleader>t :VimwikiTabnewLink<CR>
    :au FileType vimwiki noremap <buffer> <localleader>8 :VimwikiChangeSymbolTo *<CR>
    :au FileType vimwiki noremap <buffer> <localleader>* :VimwikiChangeSymbolInListTo *<CR>
    :au FileType vimwiki noremap <buffer> <localleader>_ :VimwikiChangeSymbolTo -<CR>
    :au FileType vimwiki noremap <buffer> <localleader>- :VimwikiChangeSymbolInListTo -<CR>
    :au FileType vimwiki noremap <buffer> <localleader>3 :VimwikiChangeSymbolTo #<CR>
    :au FileType vimwiki noremap <buffer> <localleader># :VimwikiChangeSymbolInListTo #<CR>
		:au FileType vimwiki noremap <buffer> <localleader>wv :VimwikiVSplitLink<CR>
		:au filetype vimwiki noremap <buffer> <localleader>ws :VimwikiSplitLink<CR>
		
		" markdown
		:au filetype vimwiki vnoremap <buffer> <localleader>_ iw<esc>`<i_<esc>`> a_
		:au filetype vimwiki nnoremap <buffer> <localleader>_ viw<esc>a_<esc>hbi_<esc>lel
		:au filetype vimwiki vnoremap <buffer> <localleader>* iw<esc>`<i*<esc>`> a*
		:au filetype vimwiki vnoremap	<buffer> <localleader>* viw<esc>a*<esc>hbi*<esc>lel
		
		" -------------------- "
		" wiki template macros "
		" -------------------- "
		" literature review notes
		:au Filetype vimwiki nnoremap <localleader>tl i= title = <cr><cr><cr>= authors = <cr><cr><cr>= synopsis = <cr><cr><cr>= conclusions =<cr><cr><cr>= criticisms =<cr><cr><cr>= notes =<cr>== general ==<cr>* 

		" group meetings
		:au Filetype vimwiki nnoremap <localleader>tmg i= files = <cr>[[file:~/Documents/meetings/research_group/<esc>"=strftime("%Y-%m-%d")<cr>pa/draft.odp]]<cr>[[file:~/Documents/meetings/research_group/<esc>"=strftime("%Y-%m-%d")<cr>pa/report.pdf]]<cr><cr>= notes =<cr>* 

		" meetings
		:au Filetype vimwiki nnoremap <localleader>tmi i= files = <cr>[[file:~/Documents/meetings/individual/<esc>"=strftime("%Y-%m-%d")<cr>pa/draft.odp]]<cr>[[file:~/Documents/meetings/individual/<esc>"=strftime("%Y-%m-%d")<cr>pa/report.pdf]]<cr><cr>= notes =<cr>* 
		
  :augroup END
	" }}}

  " html autocmd group --------------------------------------- {{{
  :augroup filetype_html
    :autocmd!
    ":au BufWritePre *.html :normal gg=G
    ":au FileType html setlocal sw=3
    ":au FileType html setlocal ts=3
		:au FileType html setlocal smarttab
		:au FileType html setlocal smartindent
		:au FileType html setlocal autoindent
  :augroup END
	" }}}

	" htmldjango autocmd group --------------------------------{{{
	:augroup filetype_htmldjango
		:autocmd!
		:au FileType htmldjango setlocal sw=3
		:au FileType htmldjango setlocal ts=3
	:augroup END
	" }}}

  " fish autocmd group ----------------------------------- {{{
  :augroup filetype_fish
    :autocmd!
    :au FileType fish setlocal ts=2
    :au FileType fish setlocal sw=2
    :au FileType fish setlocal expandtab
  :augroup END
	" }}}
  
  " fortran autocmd group ---------------------------------- {{{
  :augroup filetype_fortran
    :autocmd!
		" :au FileType fortran setlocal smarttab
		" :au FileType fortran setlocal expandtab
    " :au Filetype fortran setlocal tabstop=2
		" :au FileType fortran setlocal sw=2
    " :au FileType fortran setlocal bs=2
    " :au FileType fortran setlocal ignorecase
    " :au FileType fortran setlocal smartcase
    :au FileType fortran let fortran_fold=1
    " :au FileType fortran let fortran_fold_conditionals=1
    " :au FileType fortran let fortran_fold_multilinecomments=1
    :au FileType fortran let fortran_more_precise=1
    " :au FileType fortran let fortran_have_tabs=1
  :augroup END
	" " }}}

	" rust autocmd group ----------------------------------- {{{
	:augroup filetype_rust
		:autocmd!
		:au FileType rust inoremap <buffer> <CR>a => 
	:augroup END
	" }}}

	" markdown autcmd group ---------------------------------- {{{
	:augroup filetype_markdown
		:autocmd!
		:au FileType vimwiki let maplocalleader="\'"
		:au filetype markdown vnoremap <buffer> <localleader>_ iw<esc>`<i_<esc>`> a_
		:au filetype markdown nnoremap <buffer> <localleader>_ viw<esc>a_<esc>hbi_<esc>lel
		:au filetype markdown vnoremap <buffer> <localleader>* iw<esc>`<i*<esc>`> a*
		:au filetype markdown vnoremap <buffer> <localleader>* viw<esc>a*<esc>hbi*<esc>lel
	:augroup END
	" }}}

	" vimscript autocmd group --------------------- {{{
	:augroup filetype_vim
		:autocmd!
		:au Filetype vim setlocal foldmethod=marker
	:augroup END
	" }}}
	
	" typescript ----------------------------------- {{{
	:augroup filetype_typescript
		:au FileType typescript setlocal smarttab
		:au FileType typescript setlocal expandtab
    :au Filetype typescript setlocal tabstop=4
		:au FileType typescript setlocal shiftwidth=4
	:augroup END
	" }}}
	
	" javascript ----------------------------------- {{{
	:augroup filetype_javascript
		:au FileType javascript setlocal smarttab
		:au FileType javascript setlocal autoindent
		:au FileType javascript setlocal expandtab
    :au Filetype javascript setlocal tabstop=4
		:au FileType javascript setlocal shiftwidth=4
	:augroup END
	" }}}

" << terminal >> {{{

au TermOpen * startinsert
au BufEnter term://* startinsert
au TermClose * bd!

" }}}

" << JSON >> {{{

augroup filetype_json
	" change comments for jsonc
	au FileType json syntax match Comment +\/\/.\+$+
augroup END

" }}}

endif

" }}}

" << custom funcs >> {{{

" format python
function FormatPython()
	Black
	CocCommand python.sortImports
endfunction


" create custom ToCs for vimtex
function CreateTocs()
	let g:custom_toc1 = vimtex#toc#new({
			\ 'mode': 4,
			\ 'fold_enable': 1,
			\ 'layer_status': {
			\		'content': 1,
			\		'label': 0,
			\		'include': 0,
			\		'todo': 0
			\	},
			\ 'layer_keys': {
			\		'content': 'C',
			\		'label': 'L',
			\		'inlcude': 'I'
			\	},
			\	'show_help': 1,
			\})
	nnoremap <silent> <localleader>ct :call g:custom_toc1.open()<cr>

	let g:custom_toc2 = vimtex#toc#new({
			\ 'mode': 4,
			\ 'fold_enable': 1,
			\ 'hotkeys_enabled': 1,
			\ 'layers' : ['todo'],
			\	'show_help': 1,
			\ 'todo_sorted': 1
			\})
	nnoremap <silent> <localleader>cT :call g:custom_toc2.open()<cr>
endfunction

" }}}

" << digraphs >> {{{

" subscripts {{{

execute "digraphs kb " . 0x2096 
execute "digraphs ab " . 0x2090
execute "digraphs eb " . 0x2091
execute "digraphs hb " . 0x2095
execute "digraphs ib " . 0x1D62
execute "digraphs kb " . 0x2096
execute "digraphs lb " . 0x2097
execute "digraphs mb " . 0x2098
execute "digraphs nb " . 0x2099
execute "digraphs ob " . 0x2092
execute "digraphs pb " . 0x209A
execute "digraphs rb " . 0x1D63
execute "digraphs sb " . 0x209B
execute "digraphs tb " . 0x209C
execute "digraphs ub " . 0x1D64
execute "digraphs vb " . 0x1D65
execute "digraphs xb " . 0x2093

" }}}

" }}}

" << colors >> {{{

colorscheme 0x7A69_dark

"let darktrim = 234
"let graytrim = 242

hi Pmenu ctermfg=0 ctermbg=66

"hi VertSplit ctermfg=234 ctermbg=234
"hi StatusLine ctermfg=234 ctermbg=239
"hi StatusLineNC ctermfg=234 ctermbg=234
"hi StatusLineTerm ctermfg=234 ctermbg=239
"hi StatusLineTermNC ctermfg=234 ctermbg=234
"hi SignColumn cterm=bold ctermfg=14 ctermbg=242
"hi TermCursorNC ctermbg=242 cterm=NONE

" pylint
hi Search ctermfg=white ctermbg=blue

" invisible characters 
hi NonText guifg=#4d4c42 guibg=bg
hi SpecialKey guifg=#4d4c42

" vimwiki {{{

hi VimwikiHeader1 ctermfg=2
hi VimwikiHeader2 ctermfg=4
hi VimwikiHeader3 ctermfg=10
hi VimwikiHeader4 ctermfg=140
hi VimwikiHeader5 ctermfg=8
hi VimwikiHeader6 ctermfg=1

" }}}
" vim: set foldmethod=marker
