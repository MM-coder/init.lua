-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- Core utilities
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'wakatime/vim-wakatime',
  'folke/trouble.nvim',

  ---------------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'pyright',
          'ruff',
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Completion
  ---------------------------------------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
    },
  },

  ---------------------------------------------------------------------------
  -- Which-key
  ---------------------------------------------------------------------------
  { 'folke/which-key.nvim', opts = {} },

  ---------------------------------------------------------------------------
  -- Git
  ---------------------------------------------------------------------------
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Theme
  ---------------------------------------------------------------------------
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  ---------------------------------------------------------------------------
  -- Statusline
  ---------------------------------------------------------------------------
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Icons
  ---------------------------------------------------------------------------
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({ default = true })
    end,
  },

  ---------------------------------------------------------------------------
  -- Copilot
  ---------------------------------------------------------------------------
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { auto_trigger = true },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Formatting
  ---------------------------------------------------------------------------
  {
    'stevearc/conform.nvim',
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- Indentation guides
  ---------------------------------------------------------------------------
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- Comments
  ---------------------------------------------------------------------------
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  ---------------------------------------------------------------------------
  -- Telescope
  ---------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Mini
  ---------------------------------------------------------------------------
  {
    'echasnovski/mini.nvim',
    version = false,
  },

  ---------------------------------------------------------------------------
  -- Dashboard
  ---------------------------------------------------------------------------
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- Svelte
  ---------------------------------------------------------------------------
  'leafOfTree/vim-svelte-plugin',

  ---------------------------------------------------------------------------
  -- Barbecue (FIXED)
  ---------------------------------------------------------------------------
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
    opts = {},
  },

}, {})
