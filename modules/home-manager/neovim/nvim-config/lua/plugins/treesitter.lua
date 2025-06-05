return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auroinstall = true,
      ensure_installed = { "lua", "java", "python", "scala", "c", "bash", "nix"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
