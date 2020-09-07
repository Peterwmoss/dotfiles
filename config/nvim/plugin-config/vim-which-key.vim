nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map =  {}

let g:which_key_map.t = { 'name' : '+tabs' }
let g:which_key_map.b = { 'name' : '+buffers and splits' }
let g:which_key_map.c = { 'name' : '+cmds' }
let g:which_key_map.g = { 'name' : '+git' }
let g:which_key_map.p = { 'name' : '+lineaction' }
let g:which_key_map.q = { 'name' : '+quit' }
let g:which_key_map.s = { 'name' : '+spelling' }
let g:which_key_map.r = { 'name' : '+resize' }