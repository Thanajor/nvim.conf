return {
	filetypes = { "python" },
	cmd = { "basedpyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json" },
	settings = {
		typeCheckingMode = "recommended",
		basedpyright = {
			analysis = {
				diagnosticMode = "openFilesOnly",
				inlayHints = {
					callArgumentNames = true
				}
			}
		}
	}
}
