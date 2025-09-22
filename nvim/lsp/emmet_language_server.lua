return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"eruby",
		"less",
		"sass",
		"scss",
		"pug",
		"javascriptreact",
		"typescriptreact",
	},
	init_options = {
		includelanguages = {},
		excludelanguages = {},
		extensionspath = {},
		preferences = {},
		showabbreviationsuggestions = true,
		showexpandedabbreviation = "always",
		showsuggestionsassnippets = false,
		syntaxprofiles = {},
		variables = {},
	},

	root_markers = { ".git" },
}
