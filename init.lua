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
	["n|<leader>cc"] = map_cr("CMake cancel"):with_noremap():with_silent():with_desc("cmake: cancel"),
}
local Path = require('plenary.path')
require('cmake').setup({
  cmake_executable = 'cmake', -- CMake executable to run.
  save_before_build = true, -- Save all buffers before building.
  parameters_file = 'neovim.json', -- JSON file to store information about selected target, run arguments and build type.
  default_parameters = { args = {}, build_type = 'Debug' }, -- The default values in `parameters_file`. Can also optionally contain `run_dir` with the working directory for applications.
  build_dir = tostring(Path:new('{cwd}', 'build-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
  default_projects_path = tostring(Path:new(vim.loop.os_homedir(), 'Projects')), -- Default folder for creating project.
  configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1'}, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
  build_args = {
      '-j12',
  }, -- Default arguments that will be always passed at cmake build step.
  on_build_output = nil, -- Callback that will be called each time data is received by the current process. Accepts the received data as an argument.
  quickfix = {
    pos = 'botright', -- Where to open quickfix
    height = 10, -- Height of the opened quickfix.
    only_on_error = false, -- Open quickfix window only if target build failed.
  },
  copy_compile_commands = true, -- Copy compile_commands.json to current working directory.
  dap_configurations = { -- Table of different DAP configurations.
    lldb_vscode = { type = 'lldb', request = 'launch' },
    cppdbg_vscode = { type = 'cppdbg', request = 'launch' },
  },
  dap_configuration = 'lldb_vscode', -- DAP configuration to use if the projects `parameters_file` does not specify one.
  dap_open_command = function(...) require('dap').repl.open(...) end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
})

bind.nvim_load_mapping(plug_map)

vim.cmd 'set mouse='
vim.cmd 'au BufNewFile,BufRead *.cu set ft=cpp'
vim.cmd 'au BufNewFile,BufRead *.cuh set ft=cpp'
