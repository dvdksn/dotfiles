local luasnip = require 'luasnip'

local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
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

-- Next choice
vim.keymap.set({"i", "s"}, "<C-s>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })

-- local function feedchar(key)
--   local escaped = vim.api.nvim_replace_termcodes(key, true, false, true)
--   vim.api.nvim_feedkeys(escaped, "n", false)
-- end
--
-- vim.keymap.set({"i", "s"}, "<Tab>", function()
--   if luasnip.jumpable(1) then
--     luasnip.jump(1)
--   else
--     feedchar("<Tab>")
--   end
-- end)
--
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function()
--   if luasnip.jumpable(-1) then
--     luasnip.jump(-1)
--   else
--     feedchar("<Tab>")
--   end
-- end)

luasnip.add_snippets("markdown", {
  s({
    trig = "newdoc",
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
    name = "Create a new link",
    dscr = "Creates a new internal or external link.",
    docstring = '[link text](/path/to/target/)',
  }, {
    t("["),
    i(1),
    t("]("),
    i(2),
    t(")"),
  }),
  s({
    trig = "image",
    name = "Create a new image",
    dscr = "Creates a new Markdown image.",
    docstring = '![alt text](/path/to/image.png)',
  }, {
    t("!["),
    i(1),
    t("]("),
    i(2),
    t(")"),
  }),
  s({
    trig = "raw",
    name = "Raw section (start)",
    dscr = "Creates an opening raw tag.",
    docstring = '{% raw %}',
  }, {
    t("{% raw %}"),
  }),
  s({
    trig = "endraw",
    name = "Raw section (end)",
    dscr = "Creates an closing raw tag.",
    docstring = '{% endraw %}',
  }, {
    t("{% endraw %}"),
  }),
  s({
    trig = "tabs",
    name = "Tab group",
    dscr = "Creates an empty tab group.",
    docstring = '{{< tabs >}}{{< /tabs >}}',
  }, {
      t({"{{< tabs >}}", ""}),
      i(0),
      t({"", "{{< /tabs >}}"}),
  }),
  s({
    trig = "tab",
    name = "Tab",
    dscr = "Creates a single tab.",
    docstring = '{{< tab name="" >}}\n{{< /tab >}}',
  }, {
      t("{{< tab name=\""),
      i(1),
      t({"\" >}}"}),
      i(0),
      t({"", "{{< /tab >}}"}),
  }),

})
