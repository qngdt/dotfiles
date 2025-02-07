-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Enable 24-bit colour
vim.opt.termguicolors = true

-- Indentation size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Line wrap
vim.opt.textwidth = 120
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Better save
vim.api.nvim_create_user_command('W', 'w', {})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

-- Buffer keymaps
vim.keymap.set('n', '<leader><leader>', ':b#<CR>',
  { desc = 'Switch to the previous buffer', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror [M]essages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickfix keymaps
vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Go to previous [Q]uickfix item', noremap = true, silent = true })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Go to next [Q]uikfix item', noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab navigation
vim.keymap.set('n', ']t', ':tabnext<CR>', { desc = 'Move to the next tab', noremap = true, silent = true })
vim.keymap.set('n', '[t', ':tabprevious<CR>', { desc = 'Move to the previous tab', noremap = true, silent = true })

-- Cursor navigation
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Press jk fast to exit insert mode' })
vim.keymap.set('v', 'p', 'P', { desc = 'Quick copy in visual mode' })
vim.keymap.set({ 'n', 'v' }, '<leader>j', 'J', { desc = 'Join line' })
vim.keymap.set({ 'n', 'v' }, 'J', '<C-d>zz', { desc = 'Fast down' })
vim.keymap.set({ 'n', 'v' }, 'K', '<C-u>zz', { desc = 'Fast up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Fast down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Fast up' })
vim.keymap.set({ 'n', 'v', 'o' }, 'B', '^', { desc = 'Go to the begining of the line' })
vim.keymap.set({ 'n', 'v', 'o' }, 'E', '$', { desc = 'Go to the end of the line' })

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Shift left <<<' })
vim.keymap.set('v', '>', '>gv', { desc = 'Shift right >>>' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { 'folke/lazydev.nvim',    opts = {} },

  { 'numToStr/Comment.nvim', opts = {} },

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
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then
            vim.cmd.normal { ']g', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next [g]it change' })

        map('n', '[g', function()
          if vim.wo.diff then
            vim.cmd.normal { '[g', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous [g]it change' })

        -- Actions
        -- normal mode
        map('n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      end,
    },
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = { enabled = true },
      picker = {
        matcher = {
          frecency = true,
          history_bonus = true,
        },
        win = {
          input = {
            keys = {
              ["<C-d>"] = { "bufdelete", mode = { "n", "i" } },
              ["<C-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<C-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            },
          },
        }
      },
    },
    keys = {
      { '<leader>so', function() Snacks.picker.buffers() end,               desc = '[S]earch [O]pen Files' },
      { '<leader>sf', function() Snacks.picker.files() end,                 desc = '[S]earch [F]iles' },
      { '<leader>sd', function() Snacks.picker.diagnostics() end,           desc = '[S]earch [D]iagnostic' },
      { '<leader>sh', function() Snacks.picker.help() end,                  desc = '[S]earch [H]elp' },
      { '<leader>sk', function() Snacks.picker.keymaps() end,               desc = '[S]earch [K]keymaps' },
      { '<leader>sg', function() Snacks.picker.grep() end,                  desc = '[S]earch [G]rep' },
      { '<leader>sw', function() Snacks.picker.grep_word() end,             desc = '[S]earch [W]ord' },
      { '<leader>gd', function() Snacks.picker.git_diff() end,              desc = '[G]it [D]iff' },
      { 'gd',         function() Snacks.picker.lsp_definitions() end,       desc = '[G]oto [D]efinition' },
      { 'gD',         function() Snacks.picker.lsp_declarations() end,      desc = '[G]oto [D]eclaration' },
      { 'gr',         function() Snacks.picker.lsp_references() end,        desc = '[G]oto [R]eferences',      nowait = true },
      { 'gI',         function() Snacks.picker.lsp_implementations() end,   desc = '[G]oto [I]mplementation' },
      { '<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP [W]orkspace [S]ymbols' },
    },
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          local imap = function(keys, func, desc)
            vim.keymap.set('i', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('gh', vim.lsp.buf.hover, 'Hover Documentation')
          imap('<C-k>', vim.lsp.buf.signature_help, 'Hover Signature Help')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        bashls = {},
        sqlls = {},
        ts_ls = {},
        gopls = {},
        ruff = {},
        elixirls = {},
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
        ensure_installed = ensure_installed,
        automatic_installation = true,
      }
    end,
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        --
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        javascript = { 'prettier', lsp_format = 'fallback' },
        typescript = { 'prettier', lsp_format = 'fallback' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        go = { 'goimports', 'gofumpt' },
      },
    },
    init = function()
      vim.g.disable_autoformat = true
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
        vim.api.nvim_echo({
          {
            'Auto Format Disabled',
          },
        }, true, {})
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
        vim.api.nvim_echo({
          {
            'Auto Format Enabled',
          },
        }, true, {})
      end, {
        desc = 'Enable autoformat-on-save',
      })
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<CR>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  { -- Theme
    'sainnhe/gruvbox-material',
    priority = 1000,
    init = function()
      local hour = tonumber(os.date '%H')
      if hour >= 6 and hour < 18 then
        vim.o.background = 'light'
      else
        vim.o.background = 'dark'
      end
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      require('mini.pairs').setup()

      require('mini.files').setup {
        mappings = {
          close = '<C-c>',
        },
      }
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end
      vim.keymap.set('n', '<leader>fe', minifiles_toggle, { noremap = true, desc = 'Toggle [F]ile [E]xplorer' })
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'html',
        'lua',
        'markdown',
        'vim',
        'typescript',
        'javascript',
        'go',
        'sql',
        'elixir',
        'diff',
        'git_rebase',
        'gitcommit',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>a',
          node_incremental = '<leader>a',
          node_decremental = '<bs>',
          scope_incremental = false,
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
          goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
          goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
          goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
--o vim: ts=2 sts=2 sw=2 et
