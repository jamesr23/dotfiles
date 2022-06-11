require("packer").startup {
    function()
        use 'wbthomason/packer.nvim'
    
        use 'williamboman/nvim-lsp-installer'
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-lua/popup.nvim'
        -- use 'nvim-lua/completion-nvim'
        
        use 'hrsh7th/nvim-cmp' -- completion
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'

        use 'L3MON4D3/LuaSnip' -- snippets
        use 'rafamadriz/friendly-snippets' 

        use { 'catppuccin/nvim', as = "catppuccin"} -- colorscheme

        use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
        use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
        use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
}

require 'catppuccin'.setup {
    transparent_background = true,
    integrations = {
        nvimtree = {
            transparent_panel = true,
        },
        bufferline = false
    }
}

-- lualine
require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'}, lualine_x = {'encoding', 'fileformat', 'filetype'}, lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require 'nvim-tree'.setup {
    hijack_cursor = true,
    hijack_directories = {
        enable = false,
    },
}

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})

require 'bufferline'.setup {
    options = {
        mode = "tabs",
        numbers = "none",
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center" }},
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false
    }
}

vim.cmd [[
    hi NvimTreeNormal guibg=none
    hi BufferLineFill guibg=none
    hi BufferLineBackground guibg=none
    hi BufferLineFill guibg=none
    hi BufferLineBackground guibg=none
    hi BufferLineSeparator guibg=none
]]

-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
-- require('catppuccin').setup({transparent_background = true})
-- require('nvim-tree').setup()

require'luasnip/loaders/from_vscode'.lazy_load()

local cmp = require 'cmp'
local luasnip = require 'luasnip'
local icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup {
    snippet = {
    expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons - find some icons
            vim_item.kind = string.format('%s', icons[vim_item.kind])
            vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    }
}

require 'nvim-lsp-installer'.setup {}
require 'lspconfig'.tsserver.setup {on_attach=require('completion').on_attach}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.rust_analyzer.setup {}
require 'lspconfig'.sumneko_lua.setup {}
