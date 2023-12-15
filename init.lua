if not vim.g.vscode then
	require("core")
end

-- Final Map
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")
local plug_map = {
    -- Plugin: cmake
	["n|<leader>cb"] = map_cr("CMake build"):with_noremap():with_silent():with_desc("cmake: build"),
	["n|<leader>cB"] = map_cr("CMake build_and_run"):with_noremap():with_silent():with_desc("cmake: build_and_run"),
	["n|<leader>cr"] = map_cr("CMake run"):with_noremap():with_silent():with_desc("cmake: run"),
	["n|<leader>cg"] = map_cr("CMake configure"):with_noremap():with_silent():with_desc("cmake: configure"),
	["n|<leader>ct"] = map_cr("CMake select_target"):with_noremap():with_silent():with_desc("cmake: select_target"),
}

bind.nvim_load_mapping(plug_map)

vim.cmd 'set mouse='
require('leap').add_default_mappings()
