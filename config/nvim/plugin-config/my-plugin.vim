function FixLastSpellingError()
    if &spell
        norm! mm[s1z=`m
    else
        echohl ErrorMsg
        echo "Spelling not turned on"
    endif
endfunction

function FixNextSpellingError()
    if &spell
        norm! mm]s1z=`m
    else
        echohl ErrorMsg
        echo "Spelling not turned on"
    endif
endfunction

nnoremap <leader>sF :call FixLastSpellingError()<cr>
nnoremap <leader>sf :call FixNextSpellingError()<cr>
