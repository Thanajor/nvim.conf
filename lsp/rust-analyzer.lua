return {
	filetypes = {"rust"},
	cmd = {"rust-analyzer"},
	root_markers = {"Cargo.toml"},
	settings = {
	},
	on_attach = function(client, bufnr)
		-- Based on https://github.com/tobyvin/.dotfiles/blob/f28ab1758a9e05fbf2f083974f8ff13cf785bfc2/nvim/.config/nvim/lsp/rust_analyzer.lua#L75
		-- See https://rust-analyzer.github.io/book/contributing/lsp-extensions.html#open-external-documentation
		local function external_docs()
			local params = vim.lsp.util.make_position_params(0, client.offset_encoding)

			---@class ExternalDocsResponse
			---@field web? string
			---@field local? string
			---@class LspResponse
			---@field err? lsp.ResponseError
			---@field result ExternalDocsResponse | string
			local resp = client:request_sync("experimental/externaldocs", params, nil, bufnr)

			if not resp then
				return false
			end

			if resp.err then
				vim.notify("LSP error: " .. tostring(resp.err), vim.log.levels.ERROR)
				return false
			end

			-- Case when "localDocs" is set to false
			if type(resp.result) == "string" then
				vim.ui.open(resp.result)
				return true
			end

			-- Case when "localDocs" is set to true
			if resp.result.web then
				vim.ui.open(resp.result.web)
				return true
			end

			if resp.result["local"] and vim.env.SSH_CONNECTION == nil then
				---@type string
				local uri = resp.result["local"]:gsub("/[^/]+(/macro%.[^/]+.html)", "%1")
				local cmd = {
					"cargo",
					"+nightly",
					"-Z",
					"unstable-options",
					"config",
					"get",
					"--format=json",
					"build.target",
				}
				local stdout = vim.system(cmd, { text = true }):wait().stdout
				if stdout and stdout ~= "" then
					local target = vim.json.decode(stdout).build.target
					if target then
						uri = uri:gsub("/target/doc/", ("/target/%s/doc/"):format(target))
					end
				end

				local path = uri:gsub("^file://", ""):gsub("%.html#.*$", ".html")
				if vim.uv.fs_stat(path) then
					vim.ui.open(uri)
					return true
				end
			end

			return false
		end

		vim.keymap.set({ "x", "n" }, "gx", function()
			return external_docs() and "<ignore>" or "gx"
		end, {
			expr = true,
			desc = "open external docs",
			buffer = bufnr,
		})

		vim.api.nvim_buf_create_user_command(bufnr, "RustExternalDocs", function()
			return external_docs() or vim.notify("no external docs found", vim.log.levels.warn, { title = client.name })
		end, {
			desc = "open external docs",
		})
  end,
}

-- root_dir = vim.fs.root(0, { "Cargo.toml" }),
-- root_dir = function()
-- 	local root = vim.fs.root(0, { "Cargo.toml" })
-- 	local out = vim.system({"cargo", "metadata", "--no-deps", "--format-version", "1"}, { cwd = root }):wait()
-- 	if out.code ~= 0 then
-- 		return root
-- 	end
--
-- 	local ok, result = pcall(vim.json.decode, out.stdout)
-- 	if ok and result.workspace_root then
-- 		return result.workspace_root
-- 	end
--
-- 	return root
-- end,
