return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- or latte, frappe, macchiato
      integrations = {
        telescope = true,
        treesitter = true,
        neotree = true,
        cmp = true,
        lsp_trouble = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

