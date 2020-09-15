nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

"Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['/'] = [ ':Commentary'                    , 'comment' ]
"let g:which_key_map['?'] = [ ':CocSearch <C-R>=expand("word")<CR><CR>'                    , 'project rename' ]
let g:which_key_map['d'] = [ ':Bdelete'                           , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer'               , 'explorer' ]
let g:which_key_map['h'] = [ ':split'                             , 'split below']
let g:which_key_map['f'] = [ ':Files'                             , 'search files' ]
let g:which_key_map['q'] = [ ':q'                                  , 'quit' ]
let g:which_key_map['v'] = [ ':vsplit'                             , 'split right']
let g:which_key_map['w'] = [ ':w'                                  , 'write' ]
let g:which_key_map['W'] = [ ':wa'                                  , 'write all' ]
let g:which_key_map['q'] = [ ':q'                                  , 'quit' ]
let g:which_key_map['Q'] = [ ':qa'                                  , 'quit all' ]
let g:which_key_map['s'] = [ ':set spell!'                                  , 'toggle spelling' ]
let g:which_key_map['S'] = [ ':%s//gI'                                  , 'search and replace globally' ]
let g:which_key_map['X'] = [ ':set background=dark'                                  , 'Dark background' ]
let g:which_key_map['x'] = [ ':set background=light'                                  , 'Light background' ]

let g:which_key_map.r = { 
      \ 'name' : '+resize' ,
      \ 'h' : [ 'stuff' , 'horizontal' ],
      \ 'v' : [ 'stuff' , 'vertical' ],
      \ }

let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ }


" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" t is for toggles
let g:which_key_map.t = {
      \ 'name' : '+toggles' ,
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'n' : [':FloatermNew'         , 'new terminal'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'h' : [':FloatermNew htop'                            , 'htop'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
