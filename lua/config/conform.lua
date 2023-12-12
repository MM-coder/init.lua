-- Setup Conform

local prettier = { { "prettier", "prettierd" } }

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
      yaml = prettier,
      javascript = prettier,
      json = prettier,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    }
  }
)
