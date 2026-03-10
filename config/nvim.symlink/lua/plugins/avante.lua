return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	config = function(_, opts)
		require("avante").setup(opts)
		-- Patch Bedrock provider to use aws2 instead of aws
		local bedrock = require("avante.providers.bedrock")
		bedrock.check_aws_cli_installed = function()
			local result = vim.system({ "aws2", "--version" }, { text = true }):wait(10000)
			return result.code == 0
		end
		bedrock.get_aws_credentials = function(self, region, profile)
			local awsCreds = {
				access_key_id = "",
				secret_access_key = "",
				session_token = "",
			}
			local args = { "aws2", "configure", "export-credentials" }
			if profile and profile ~= "" then
				table.insert(args, "--profile")
				table.insert(args, profile)
			end
			if region and region ~= "" then
				table.insert(args, "--region")
				table.insert(args, region)
			end
			local result = vim.system(args, { text = true }):wait(10000)
			if result.code == 0 then
				local credentials = vim.json.decode(result.stdout)
				awsCreds.access_key_id = credentials.AccessKeyId
				awsCreds.secret_access_key = credentials.SecretAccessKey
				awsCreds.session_token = credentials.SessionToken
			end
			return awsCreds
		end
	end,
	opts = {
		-- add any opts here
		-- this file can contain specific instructions for your project
		instructions_file = "avante.md",
		-- for example
		provider = "bedrock",
		providers = {
			bedrock = {
				model = "eu.anthropic.claude-haiku-4-5-20251001-v1:0",
				aws_region = "eu-west-1",
				aws_profile = "DeveloperClaudeCodeDATAAIDev",
				timeout = 30000,
				-- extra_request_body = {
				--     temperature = 0.75,
				--     max_tokens = 20480,
				-- },
			},
			-- claude = {
			-- 	endpoint = "https://api.anthropic.com",
			-- 	model = "claude-sonnet-4-20250514",
			-- 	timeout = 30000, -- Timeout in milliseconds
			-- 	extra_request_body = {
			-- 		temperature = 0.75,
			-- 		max_tokens = 20480,
			-- 	},
			-- },
			-- moonshot = {
			-- 	endpoint = "https://api.moonshot.ai/v1",
			-- 	model = "kimi-k2-0711-preview",
			-- 	timeout = 30000, -- Timeout in milliseconds
			-- 	extra_request_body = {
			-- 		temperature = 0.75,
			-- 		max_tokens = 32768,
			-- 	},
			-- },
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-mini/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
