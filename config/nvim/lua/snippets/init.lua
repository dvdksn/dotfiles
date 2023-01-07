local luasnip = require 'luasnip'

local s = require("luasnip.nodes.snippet").S
local sn = require("luasnip.nodes.snippet").SN
local isn = require("luasnip.nodes.snippet").ISN
local t = require("luasnip.nodes.textNode").T
local i = require("luasnip.nodes.insertNode").I
local f = require("luasnip.nodes.functionNode").F
local c = require("luasnip.nodes.choiceNode").C
local d = require("luasnip.nodes.dynamicNode").D
local r = require("luasnip.nodes.restoreNode").R
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

luasnip.add_snippets("markdown", {
  s({
    trig = "new document",
    name = "New docs page",
    dscr = "Creates a new docs page with front matter template.",
    docstring = "---\ntitle: \ndescription: \nkeywords: []\n---",
  }, {
    t({ "---", "" }),
    t { ("title: ") },
    i(1),
    t({ "", "description: " }),
    i(2),
    t({ "", "keywords: " }),
    i(3),
    t({ "", "---", "", "" }),
    i(0)
  }),
  s({
    trig = "link",
  }, {
    t("["),
    i(1),
    t("]("),
    i(2),
    t(")"),
    c(3, {
      t('{: target="blank" rel="noopener" class="_"}'),
      t(''),
    }),
  }),
})
