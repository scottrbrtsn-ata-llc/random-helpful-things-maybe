# Conjure and neovim
[Conjure Github](https://github.com/Olical/conjure/)

## Install the things
#### Install conjure
`use { "Olical/conjure" }`

#### Install shadow-cljs
`npm install shadow-cljs -g`

### Connecting to project clj repl
1. run your nREPL via cider middleware in the project root dir (contains `deps.edn`)
```clj -Sdeps '{:deps {nrepl/nrepl {:mvn/version "1.0.0"} cider/cider-nrepl {:mvn/version "0.40.0"}}}'     --main nrepl.cmdline     --middleware '["cider.nrepl/cider-middleware"]'     --interactive```
  1. consider setting an `alias cnj={the above command}`
1. open a file in your project.  It should pick up the same nREPL port via the .nrepl-port file created by `clj`
  1. if not `:ConjureConnect: {.nrepl-port}`

### Connecting to project clj repl
1. run `shadow-cljs compile {key from shadow-cljs.edn}` next to the edn.
1. open a file in your project
1. `:ConjureShadowSelect {key from edn}` 
  1. TODO: [make this a hook when `.cljs` files load](https://github.com/Olical/conjure/issues/318). 

```clj -Sdeps '{:deps {nrepl/nrepl {:mvn/version "1.0.0"} cider/cider-nrepl {:mvn/version "0.40.0"}}}'     --main nrepl.cmdline     --middleware '["cider.nrepl/cider-middleware"]'     --interactive```
  1. consider setting an `alias cnj={the above command}`
1. open a file in your project.  It should pick up the same nREPL port via the .nrepl-port file created by `clj`
  1. if not `:ConjureConnect: {.nrepl-port}`

### Common commands
- evaluate Visual line selection `S-V <local-leader> E` 
- hide the output window `<local-leader> lR`


#### My additional config
- For the output window
```
vim.api.nvim_set_var('conjure#log#hud#passive_close_delay', 600000)
vim.api.nvim_set_var('conjure#log#hud#anchor', 'SE')
vim.api.nvim_set_var('conjure#log#hud#width', '0.5')
vim.api.nvim_set_var('conjure#log#hud#height', '1.0')
```
