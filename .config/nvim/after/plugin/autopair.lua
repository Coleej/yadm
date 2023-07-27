local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
npairs.setup {}

npairs.add_rules({
	Rule("%", "%", "htmldjango")
			:with_move(function(opts) return opts.char == "%" end)
})

require("nvim-ts-autotag").setup {}
