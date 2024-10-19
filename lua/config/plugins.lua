-- Setting the pluggins we wanna use
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
        require('nvim-tree').setup({
            view = {
                width = 30, -- width of the tree window
                side = 'left', -- or 'right'
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            git = {
                enable = true, -- Show git status icons
            },
            filters = {
                dotfiles = false, -- Set to true if you want to hide dotfiles
            },
            actions = {
                open_file = {
                    quit_on_open = true, -- Close the tree when you open a file
                },
            },
        })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Ensures that parsers are updated
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "typescript",  -- Automatically installs the TypeScript parser
                "javascript",  -- Automatically installs the JavaScript parser
                "lua",         -- You can add more languages as needed
            },
            highlight = {
                enable = true, -- Enable Treesitter highlighting
                additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting
            },
        }
    end,
  }
}
local opts = {}

-- Loading LazyVim with the plugins and opts defined above
require("lazy").setup(plugins, opts)

-- Setting the fuzy file finder via Telescope with Plenary
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Setting the color schema intalled above
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Setting nvim-tree as the default explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Redirect `:Ex`, `:Explore`, or `:E` to `NvimTreeToggle`
vim.cmd([[ command! -nargs=* Explore NvimTreeToggle ]])
vim.cmd([[ command! -nargs=* Ex NvimTreeToggle ]])
vim.cmd([[ command! -nargs=* E NvimTreeToggle ]])
