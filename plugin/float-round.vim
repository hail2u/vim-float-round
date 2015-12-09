function! s:RoundFloat(p, s, e)
  let r = join(getline(a:s, a:e), "\n")
  let r = substitute(r,
    \ '\d\+\.\d\+',
    \ '\=printf("%.' . a:p . 'f", str2float(submatch(0)))',
    \ 'g')
  let r = substitute(r, '\(\d\+\)\.\([1-9]\+\)[0]\+\([^1-9]\)', '\1.\2\3', 'g')
  let @" = r
  execute 'normal! ' . a:s . 'GV' . a:e . 'G""p'
endfunction


command! -nargs=1 -range=% RoundFloat call <SID>RoundFloat(<f-args>, <line1>, <line2>)
