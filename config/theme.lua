-- Setup Cappucin

require("catppuccin").setup(
  {
    integrations = {
      which_key = true,
      cmp = true,
      treesitter = true,
      telescope = {
        enabled = true
      }
    }
  }
)
