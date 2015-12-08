function! s:RoundFloat(p)
  let r = ''
  let r = substitute(getline('.'), '\d\+\.\d\+',
    \ '\=printf("%.' . a:p . 'f", str2float(submatch(0)))',
    \ 'g')
  let r = substitute(r, '\(\d\+\)\.\([1-9]\+\)[0]\+\([^1-9]\)', '\1.\2\3', 'g')
  let @" = r
  normal! V""p
endfunction


command! -nargs=1 RoundFloat call <SID>RoundFloat(<f-args>)
