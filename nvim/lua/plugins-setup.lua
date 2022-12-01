local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -----------------------------------------------------------
  -- Styling plugins
  ----------------------------------------------------------

  -- Colorscheme
  use("ellisonleao/gruvbox.nvim")

  -----------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------
  -- File Manager
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
  })
  -- Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
            "build",
            "dist",
            "yarn.lock",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  })

  -----------------------------------------------------------
  -- LSP and Autocomplete
  -----------------------------------------------------------
  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/nvim-treesitter-context")
  -- Collection of configurations for built-in LSP client
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  -- Autocomplete
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("saadparwaiz1/cmp_luasnip")
  --- Автодополнлялка к файловой системе
  use("hrsh7th/cmp-path")
  -- Snippets plugin
  use("L3MON4D3/LuaSnip")
  -- Formatting
  use("jose-elias-alvarez/null-ls.nvim")

  -- use("mechatroner/rainbow_csv")
  use("junegunn/vim-easy-align")
  use("chrisbra/csv.vim")
  -----------------------------------------------------------
  -- HTML и CSS
  -----------------------------------------------------------
  -- Подсвечивает #ffffff
  use("ap/vim-css-color")
  -- JS/TS/JSX Syntax
  use("yuezk/vim-js")
  use("HerringtonDarkholme/yats.vim")
  use("maxmellon/vim-jsx-pretty")

  -----------------------------------------------------------
  -- РАЗНОЕ
  -----------------------------------------------------------

  -- Обрамляет или снимает обрамление. Выдели слово, нажми S и набери <h1>
  use("tpope/vim-surround")

  -- Стартовая страница, если просто набрать vim в консоле
  use("mhinz/vim-startify")

  -- Комментирует по gc все, вне зависимости от языка программирования
  use("b3nj5m1n/kommentary")

  -- Js/JSX snippets
  use("rafamadriz/friendly-snippets")

  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Обрамляет строку в теги по ctrl- y + ,
  use("mattn/emmet-vim")

  -- Закрывает автоматом скобки
  use("cohama/lexima.vim")

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = { section_separators = "", component_separators = "" },
      })
    end,
  })
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
