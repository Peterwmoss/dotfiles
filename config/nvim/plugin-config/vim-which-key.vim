nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map =  {}

let g:which_key_map.t = { 'name' : '+toggles' }
let g:which_key_map.b = { 'name' : '+buffers' }
let g:which_key_map.g = { 'name' : '+git' }
let g:which_key_map.r = { 'name' : '+resize' }
