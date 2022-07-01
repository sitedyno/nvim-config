if !exists('g:test#lua#plenary#file_pattern')
  let g:test#lua#plenary#file_pattern = '\v_spec\.(lua|moon)$'
endif

function! test#lua#plenary#test_file(file) abort
  return a:file =~# g:test#lua#plenary#file_pattern
endfunction

function! test#lua#plenary#build_position(type, position) abort
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['--filter ' . shellescape(name, 1) . ' ' . a:position['file']]
    else
      return [a:position['file']]
    endif
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

" nvim --headless --noplugin -n -u scripts/minimal_init.vim -c "PlenaryBustedDirectory lua/tests/ { minimal_init = './scripts/minimal_init.vim' }"
function! test#lua#plenary#build_args(args) abort
  let args = ['--headless', '--noplugin', '-n', '-u', 'scripts/minimal_init.vim', '-c']
  let args = args + ['"PlenaryBustedDirectory lua/tests/ { minimal_init = ''.scripts/minimal_init.vim'' }"']
  let args = args + a:args
  return args
endfunction

function! test#lua#plenary#executable() abort
  return 'nvim'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#lua#patterns)

  if !empty(name['test'])
    return s:escape_lua_pattern(name['test'][0])
  endif

  if !empty(name['namespace'])
    return s:escape_lua_pattern(name['namespace'][0])
  endif

  return ""
endfunction

" Escape Lua pattern magic characters with the Lua pattern escape character (%).
"
" The magic characters set are defined in the Lua docs at:
" https://www.lua.org/pil/20.2.html
function! s:escape_lua_pattern(pattern) abort
  let magic_characters = ["(", ")", "\\.", "%", "+", "-", "*", "?", "[", "\\^", "\\$"]
  let magic_str = join(magic_characters, "\\|")
  return substitute(a:pattern, "\\(" . magic_str . "\\)", "%\\1", "g")
endfunction
