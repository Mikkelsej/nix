return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000, -- Load before other plugins
    config = function()
      vim.cmd("colorscheme nord")
    end
  }
}
