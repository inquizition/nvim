local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
   
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use ({"rebelot/kanagawa.nvim"})
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('tpope/vim-fugitive')
	use('tpope/vim-commentary')
	use('leafOfTree/vim-project')
	-- use {
	-- 	  "ahmedkhalf/project.nvim",
	-- 	  config = function()
	-- 	  require("project_nvim").setup {
	-- 	    -- your configuration comes here
	-- 	    -- or leave it empty to use the default settings
	-- 	    -- refer to the configuration section below
	-- 	  }
	-- 	  end
	-- 	}
	use('kien/ctrlp.vim')
	use('preservim/nerdtree')
	use('sakhnik/nvim-gdb')
	use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
		-- Or lazy load with `module` option. See further down for info on how to lazy load when using FocusSplit commands
		-- Or lazy load this plugin by creating an arbitrary command using the cmd option in packer.nvim
		-- use { 'beauwilliams/focus.nvim', cmd = { "FocusSplitNicely", "FocusSplitCycle" }, module = "focus",
		--     config = function()
		--         require("focus").setup({hybridnumber = true})
		--     end
		-- }
	use('neovim/nvim-lspconfig')	
	use('folke/which-key.nvim')
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
