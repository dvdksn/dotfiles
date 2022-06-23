local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local parse = ls.parser.parse_snippet

ls.config.set_config({
  delete_check_events = "TextChanged"
})

-- vim.keymap.set({ "i", "n" }, "<C-i>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end)

require("luasnip.session.snippet_collection").clear_snippets("go")

ls.add_snippets("go", {
  -- LuaSnip syntax
  s({
    trig = "iferr",
    name = "Handle error",
    dscr = "If error does not equal nil, handle error or return",
    docstring = "if err != nil {\n\treturn err\n}",
  }, {
    t({ "if err != nil {", "\t" }),
    i(0, "return err"),
    t({ "", "}" }),
  }),
  -- LSP syntax
  parse({
    trig = "func",
  }, "func $1($2) $3 {\n\t$0\n}"),
  -- "fmt" syntax
  s({
    trig = "fmain",
    docstring = "func main() {\n\t\n}",
  }, fmt("func main() {{\n\t{}\n}}", { i(0) })),
})

ls.add_snippets("svelte", {
  s({
    trig = "ts_script_tag",
    name = "TypeScript <script> tag",
    docstring = "<script lang=\"ts\">"
  }, {
    t({ "<script lang=\"ts\">", "\t" }),
    i(0),
    t({ "", "</script>" })
  }),
  s("onmount", {
    t({ "import { onMount } from \"svelte\"", "" }),
    t("onMount(("),
    i(1),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  }),
  s("load_fn", {
    t({ "import type { Load } from '@sveltejs/kit'", "", "" }),
    t("export const load: Load = async ({ "),
    i(1, "url, params, fetch"),
    t({ " }) => {", "\t" }),
    i(0),
    t({ "", "\t" }),
    t({ "return {", "\t\t" }),
    t({ "props: {", "\t\t\t" }),
    t({ "/* payload */", "\t\t" }),
    t({ "}", "\t" }),
    t({ "}", "" }),
    t("}")

  })
})

ls.add_snippets("markdown", {
  s({
    trig = "---",
    name = "New Hugo page",
    dscr = "Creates a new Hugo page with front matter template.",
    docstring = "---\ntitle: \ndescription: \nkeywords: []\ncontentType: \n---",
  }, {
    t({ "---", "" }),
    t { ("title: ") },
    i(1),
    t({ "", "description: " }),
    i(2),
    t({ "", "keywords: [" }),
    i(3),
    t({ "]", "contentType: " }),
    i(4),
    t({ "", "---", "", "" }),
    i(0)
  })
})
