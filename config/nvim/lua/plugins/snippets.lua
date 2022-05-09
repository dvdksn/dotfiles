local luasnip = require("luasnip")
local snippet = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local parse = luasnip.parser.parse_snippet

luasnip.config.set_config({
	update_events = "TextChanged,TextChangedI",
})

require("luasnip.session.snippet_collection").clear_snippets("go")

luasnip.add_snippets("go", {
	-- LuaSnip syntax
	snippet({
		trig = "iferr",
		name = "Handle error",
		dscr = "If error does not equal nil, handle error or return",
		docstring = "if err != nil {\n\treturn err\n}",
	}, {
		text("if "),
		insert(1, "err"),
		text({ " != nil; {", "\t" }),
		insert(0, "return err"),
		text({ "", "}" }),
	}),
	-- LSP syntax
	parse({
		trig = "func",
	}, "func $1($2) $3 {\n\t$0\n}"),
	-- "fmt" syntax
	snippet({
		trig = "fmain",
		docstring = "func main() {\n\t\n}",
	}, fmt("func main() {{\n\t{}\n}}", { insert(0) })),
})
