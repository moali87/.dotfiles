local packer = require("packer")
local use = packer.use
return packer.startup(function()
  -- Non lazy loaded plugins
  use({ "wbthomason/packer.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "folke/lsp-colors.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "kdheepak/lazygit.nvim" })
  use({ "lewis6991/impatient.nvim", config = function() require("impatient").enable_profile() end })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VimEnter",
    config = function()
      require("nvim-treesitter.configs").setup(require("plugin-configs.treesitter"))
    end
  })

  -- cmp and cmp attachments
  use({
    "hrsh7th/nvim-cmp",
    after = "nvim-lspconfig",
    -- event = {"InsertEnter *", "CmdlineEnter"}, -- Can"t do this cause it"s slow
    requires = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("plugin-configs.luasnip")
        end,
        requires = {
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lsp-signature-help",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-path",
        },
      },
    },
    config = function()
      require("plugin-configs.cmp")
    end
  })

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("lualine").setup({
        options = { theme = "powerline" }
      })
    end
  })

  -- whichkey
  use ({
  "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })

  -- snap
  use ({
    "camspiers/snap",
    requires = "nvim-treesitter",
    -- rocks = { "fzy" }, -- This does not work everywhere, need to find fixes
    config = function ()
      local snap = require("snap")
      local consumer = snap.get"consumer.fzy"
      local file = snap.config.file:with {consumer = consumer }
      local grep = snap.config.vimgrep:with { consumer = consumer }
      snap.maps {
        {"<C-o>", file { producer = "fd.file", suffix = " Files❯" }},
        {"<C-p>", grep { consumer = "fzy",  producer = "ripgrep.vimgrep", suffix = " Grep❯" }},
      }
    end
  })

  -- lspinstaller
  use({
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
          icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗"
          }
        }
    })
    end
  })

  -- lint
  -- null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = function ()
      require("plugin-configs.null-ls")
    end
  })

  -- bufdelete
  use({
    "famiu/bufdelete.nvim",
    event = "BufWinEnter"
  })


  -- neorg
  use({
    "nvim-neorg/neorg",
    requires = "nvim-lua/plenary.nvim",
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require("neorg").setup(require("plugin-configs.neorg-config"))
    end
  })

  -- bufferline
  use({
    "akinsho/bufferline.nvim",
    event = "BufWinEnter",
    tag = "v2.*",
    config = function()
      require("bufferline").setup(
        require("plugin-configs.bufferline-config")
      )
    end
  })

  -- comment
  use({
    "numToStr/Comment.nvim",
    event = "BufWinEnter",
    config = function()
      require("Comment").setup()
    end
  })

  -- blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufWinEnter",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
      }
    end
  })

  -- gitsigns
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    tag = "release", -- To use the latest release
    config = function()
      require("gitsigns").setup()
    end
  })

  -- autopairs
  use({
    "windwp/nvim-autopairs",
    event = "BufWinEnter",
    requires = { { "hrsh7th/nvim-cmp" } },
    config = function()
      require("nvim-autopairs").setup()
    end
  })
end)
