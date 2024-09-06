local luasnip = require 'luasnip'

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
-- TODO: use fmt for more readable snippets
--       (or fmta which uses <> as delim)
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta

-- Next choice
vim.keymap.set({ "i", "s" }, "<C-s>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })

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
    trig = "img",
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
    trig = "tabs",
    name = "Tab group",
    dscr = "Creates an empty tab group.",
    docstring = '{{< tabs >}}{{< /tabs >}}',
  }, {
    t({ "{{< tabs >}}", "" }),
    i(0),
    t({ "", "{{< /tabs >}}" }),
  }),
  s({
    trig = "tab",
    name = "Tab",
    dscr = "Creates a single tab.",
    docstring = '{{< tab name="" >}}\n{{< /tab >}}',
  }, {
    t("{{< tab name=\""),
    i(1),
    t({ "\" >}}" }),
    i(0),
    t({ "", "{{< /tab >}}" }),
  }),
})
