" Configure tpope/vim-fugitive
command! Gadd exec "Git add -p"
command! -nargs=* Ggraph exec "vs term://git graph " . <q-args>
command! -nargs=? Gpush exec join(["Git push", len(<q-args>)==0?"origin":<q-args>, system("git rev-parse --abbrev-ref HEAD")], " ")[0:-2]
command! Gdiscard exec "Git checkout -p"
command! Gamend exec "Gcommit --amend"
command! Gpatch exec "Git diff --no-prefix"
