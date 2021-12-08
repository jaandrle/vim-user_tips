
function! user_tips#current()
    return g:user_tips_list[g:user_tips#current_id]
endfunction
function! user_tips#edit()
    execute 'e '.g:user_tips#filepath
endfunction

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
