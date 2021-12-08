
" #region Guard
if exists('g:load_user_tips') | finish | endif
let g:load_user_tips = 1
let s:save_cpo = &cpo
set cpo&vim
" #endregion

let $VIMHOME=expand('<sfile>:p:h:h:h:h')
let s:file_tips= 'user_tips.vim'
let g:user_tips#filepath= $VIMHOME.'/'.s:file_tips

if !filereadable(g:user_tips#filepath)
    let template= readfile(expand('<sfile>:p:h:h').'/'.s:file_tips)
    call writefile(template, g:user_tips#filepath)
endif
" let g:user_tips_list
execute 'so '.g:user_tips#filepath

let s:user_tips_list_len= len(g:user_tips_list)
let g:user_tips#current_id= str2nr(matchstr(reltimestr(reltime()), '\v\.\zs\d+')) % ( s:user_tips_list_len - 1 )
function! s:Next()
    let g:user_tips#current_id+= 1
    if g:user_tips#current_id == s:user_tips_list_len
        let g:user_tips#current_id-= s:user_tips_list_len
    endif
endfunction

augroup user_tips
    autocmd!
    autocmd FocusGained,BufEnter * call <sid>Next()
augroup END

" #region Finish
let &cpo = s:save_cpo
unlet s:save_cpo
" #endregion

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
