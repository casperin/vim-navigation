" This function will toggle a buffer in and our of a split mode. If the buffer
" is the only buffer in the tab, it will close the tab, if it isn't, then it
" will open a new tab with the current buffer.
"
" This is used to quickly toggle a buffer in a small split in and out of
" 'fullscreen' mode.
function! s:ToggleSingleSplit()
    if len(tabpagebuflist()) > 1
        :tabedit %
    else
        :close
    endif
endfunction

" Expose as :ToggleSingleSplit command
:command! PlusToggleSingleSplit :call s:ToggleSingleSplit()


" This function will navigate left or right in a tabs/buffer list. It assumes
" you have a buffer list if there are no tabs, or a tabs list if you have more
" than one tab. This is default behavior for vim-airline.
function! s:NavLeftRight(dir)
    " if more than one tab
    if tabpagenr('$') > 1
        if a:dir == "next"
            :tabn
        endif
        if a:dir == "prev"
            :tabp
        endif
    else
        if a:dir == "next"
            :bn
        endif
        if a:dir == "prev"
            :bp
        endif
    endif
endfunction

" Expose as :NavLeftRight command (takes one argument: 'next' or 'prev')
:command! -nargs=1 PlusNavLeftRight call s:NavLeftRight(<f-args>)


function! s:RelativeNumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

:command! ToggleRelativeNumbers call s:RelativeNumberToggle()
