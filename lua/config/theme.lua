-- Setup Cappucin

require("catppuccin").setup(
  {
    integrations = {
      which_key = true,
      cmp = true,
      treesitter = true,
      telescope = {
        enabled = true
      },
      gitsigns = true,
      lsp_trouble = true,
      barbecue = {
        dim_dirname = true, -- directory name is dimmed by default
        bold_basename = true,
        dim_context = false,
        alt_background = true,
      },
      dashboard = true,
    }
  }
)
