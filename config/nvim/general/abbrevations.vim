iabbr #d #define
iabbr #i #include

inoremap !! <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><meta name="viewport" content="width=device-width, initial-scale=1.0"><CR><title>Document</title><CR></head><CR><body><CR><CR></body><CR></html><esc>kkA<tab><tab>

function! ReloadFirefox()
    if g:live_reload
        silent !reload-firefox.sh
    endif
endfunction

function! ToggleLiveReload()
    if g:live_reload
        silent let g:live_reload = 0
    else
        silent let g:live_reload = 1
    endif
endfunction
