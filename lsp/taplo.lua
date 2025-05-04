return {
	cmd = { "taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	settings = {
		evenBetterToml = {
			schema = {
				catalogs = {
					"https://json.schemastore.org/cargo.json",
					"https://json.schemastore.org/cargo-make.json",
					"https://json.schemastore.org/rust-project.json",
					"https://json.schemastore.org/rust-toolchain.json",
					"https://json.schemastore.org/rustfmt.json",
				},
			},
		},
	},
}
