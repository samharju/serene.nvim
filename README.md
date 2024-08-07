# Serene

A mild colorscheme inspired by the builtins `habamax`, `lunaperche` and the new Neovim default
colorscheme.

## Setup

Lazy:

```lua
{
    "samharju/serene.nvim",
    -- for using as main:
    --config = function() vim.cmd.colorscheme("serene") end,
}
```

Two schemes are provided:

```lua
vim.cmd([[colorscheme serene]])
vim.cmd([[colorscheme serene-transparent]])
```


## Plugins supported

Plugins that link to defaults should generally look ok as is, pull request for adding custom 
styles to your favorite plugin is welcome.

Some specific highlights added to:

- vim-fugitive
- gitsigns.nvim
- nvim-cmp
- copilot.lua
