function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        Git blame
    endif
endfunction

nnoremap <leader>gb :call <SID>ToggleBlame()<CR>
