local ls = require("luasnip")

ls.config.set_config {
  history = true,
  delete_check_events = "InsertLeave",
  update_events = "TextChanged,TextChangedI",
}

local snippet = ls.snippet
local text = ls.text_node
local f = ls.function_node
local insert = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	snippet("func", {
		text("func "),
		insert(1, "function"),
		text("("),
		insert(2, "args"),
		text(") "),
		insert(3, "error"),
		text({ " {", "\t" }),
		insert(0),
		text({ "", "}" }),
	}),
	snippet("main", {
		text({ "func main() {", "\t" }),
		insert(0),
		text({ "", "}" }),
	}),
})


-- Expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Move to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
