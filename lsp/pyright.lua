return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
    "uv.lock",
  },
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportUnusedExpression = "none", -- Set severity to "none" to disable
        },
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
