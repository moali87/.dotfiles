return {
	"mfussenegger/nvim-lint",
	opts = {
		-- linters_by_ft = {
		-- 	fish = { "fish" },
		-- 	gitlint = { "gitlint" },
		-- 	go = { "golangcilint" },
		-- 	kotlin = { "ktlint" },
		-- 	markdown = { "markdownlint" },
		-- 	python = { "pylint" },
		-- 	ruby = { "rubocop" },
		-- 	hcl = { "tflint" },
		-- 	yaml = { "yamllint" },
		-- 	typescript = { "eslint_d" },
		-- 	javascript = { "eslint_d" },
		-- },
	},
	config = function()
		require("lint").linters_by_ft = {
			fish = { "fish" },
			gitlint = { "gitlint" },
			go = { "golangcilint" },
			kotlin = { "ktlint" },
			markdown = { "markdownlint" },
			python = { "pylint" },
			ruby = { "rubocop" },
			hcl = { "tflint" },
			yaml = { "yamllint" },
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
		}
	end,
}
