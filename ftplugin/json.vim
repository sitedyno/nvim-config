nnoremap <left> :lua require("jvim").to_parent()<CR>
nnoremap <right> :lua require("jvim").descend()<CR>
nnoremap <up> :lua require("jvim").prev_sibling()<CR>
nnoremap <down> :lua require("jvim").next_sibling()<CR>

" show json path in the winbar
if exists('+winbar')
  setlocal winbar=%{luaeval('require\"jsonpath\".get()')}
endif

" send json path to clipboard
nnoremap <buffer> y<C-p> :let @+=luaeval('require"jsonpath".get()')<CR>
