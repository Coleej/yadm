augroup custom_jedi
	autocmd!
	autocmd BufNewFile,BufReadPost *.py if maparg("K") != "<C-B>" | nunmap <buffer> K| noremap K <c-b>| endif
augroup END
