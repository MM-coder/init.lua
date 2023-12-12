-- Setup Conform

require("conform").setup(
  {
    formatters_by_ft = {
      python = {
        "ruff_fix",
        "ruff_format",
        "isort"
      },
      go = {
        "gofmt",
        "goimports"
      },
      lua = {
        "stylua"
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    }
  }
)
