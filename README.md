## Neovim Configuration

### Philisophical Ponderings 💭
1. Why use Vim over something like VSCode?
> Because it is fun :)

2. What are your editor requirements?
> - Vim motions
> - Fast start and close time
> - Seamless file navigation
> - Graphical debugging
> - Beauty
> - Enjoyment

### Prerequisites
```
NVIM v0.8.0
```

### Configured Languages
|   Language   | LSP | DAP |
|:------------:|:---:|:---:|
|  Python      | ✅  | ✅  |
|   C++        | ✅  | ❌  |
|   Java       | ❌  | ❌  |
|    Go        | ❌  | ❌  |
|   Lua        | ❌  | ❌  |
| JavaScript   | ❌  | ❌  |
| TypeScript   | ❌  | ❌  |
|   Rust       | ❌  | ❌  |

### Config Structure
```
.
├── LICENSE
├── README.md
├── after
│   └── plugin
│       ├── <plugin-name>.lua
├── init.lua
├── lua
│   └── guava
│       ├── init.lua
│       ├── keymaps.lua
│       ├── options.lua
│       └── packer.lua
├── plugin
│   └── packer_compiled.lua
└── stylua.toml
```

Plugin configuration files are placed in the `after/plugin` directory as they
are sourced last according to `:h rtp`

For all the plugins, see: `lua/guava/packer.lua`
