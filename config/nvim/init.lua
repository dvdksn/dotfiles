vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load configs
require("config.lazy")
require("mappings")
require("options")
require("autocommands")
-- require("snippets")
require("highlight")
