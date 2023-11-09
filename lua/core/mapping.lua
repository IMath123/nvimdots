local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local core_map = {
	-- Suckless
	["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent():with_desc("edit: Toggle code fold"),
	["n|<A-w>"] = map_cu("write"):with_noremap():with_silent():with_desc("edit: Save file"),
	-- ["n|<A-e>"] = map_cmd(":x<CR>"):with_noremap():with_silent():with_desc("edit: Save file and quit"),
	["n|<A-z>"] = map_cmd("^"):with_noremap():with_silent():with_desc("edit: go to head of current line"),
	["n|<A-m>"] = map_cmd("$"):with_noremap():with_silent():with_desc("edit: go to end of current line"),
	["v|<A-z>"] = map_cmd("^"):with_noremap():with_silent():with_desc("edit: go to head of current line"),
	["v|<A-m>"] = map_cmd("$"):with_noremap():with_silent():with_desc("edit: go to end of current line"),
	["n|q"] = map_cmd("%"):with_noremap():with_silent():with_desc("edit: %"),

    
	["n|Y"] = map_cmd("y$"):with_desc("edit: Yank text to EOL"),
	["n|D"] = map_cmd("d$"):with_desc("edit: Delete text to EOL"),
	["n|n"] = map_cmd("nzzzv"):with_noremap():with_desc("edit: Next search result"),
	["n|N"] = map_cmd("Nzzzv"):with_noremap():with_desc("edit: Prev search result"),
	["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("edit: Join next line"),
	["n|<Esc>"] = map_callback(function()
			_flash_esc_or_noh()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Clear search highlight"),
	["n|<A-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<A-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<A-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<A-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),

	["t|<A-h>"] = map_cmd("<Cmd>wincmd h<CR>"):with_silent():with_noremap():with_desc("window: Focus left"),
	["t|<A-l>"] = map_cmd("<Cmd>wincmd l<CR>"):with_silent():with_noremap():with_desc("window: Focus right"),
	["t|<A-j>"] = map_cmd("<Cmd>wincmd j<CR>"):with_silent():with_noremap():with_desc("window: Focus down"),
	["t|<A-k>"] = map_cmd("<Cmd>wincmd k<CR>"):with_silent():with_noremap():with_desc("window: Focus up"),

	["t|<C-u>"] = map_cmd("<C-\\><C-n><C-u>"):with_silent():with_noremap():with_desc("window: Focus up"),
	["t|<A-n>"] = map_cmd("<C-\\><C-n>"):with_silent():with_noremap():with_desc("window: Focus up"),
    ["t|<A-p>"] = map_cmd("<C-\\><C-n>pa"):with_noremap():with_silent():with_desc("edit: %"),
    ["n|<C-p>"] = map_cmd("a<C-p>"):with_noremap():with_silent():with_desc("edit: %"),
    ["n|<A-p>"] = map_cmd("pa"):with_noremap():with_silent():with_desc("edit: %"),
    ["t|<M-q>"] = map_cmd("<cmd>confirm q<cr>"):with_noremap():with_silent():with_desc("edit: %"),

    
	["n|<A-[>"] = map_cr("vertical resize -5"):with_silent():with_desc("window: Resize -5 vertically"),
	["n|<A-]>"] = map_cr("vertical resize +5"):with_silent():with_desc("window: Resize +5 vertically"),
	["n|<A-;>"] = map_cr("resize -2"):with_silent():with_desc("window: Resize -2 horizontally"),
	["n|<A-'>"] = map_cr("resize +2"):with_silent():with_desc("window: Resize +2 horizontally"),
	["n|<C-q>"] = map_cr("wq"):with_desc("edit: Save file and quit"),
	["n|<A-S-q>"] = map_cr("q!"):with_desc("edit: Force quit"),
	["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"):with_desc("edit: Toggle spell check"),
	["n|tn"] = map_cr("tabnew"):with_noremap():with_silent():with_desc("tab: Create a new tab"),
	["n|tk"] = map_cr("tabnext"):with_noremap():with_silent():with_desc("tab: Move to next tab"),
	["n|tj"] = map_cr("tabprevious"):with_noremap():with_silent():with_desc("tab: Move to previous tab"),
	["n|to"] = map_cr("tabonly"):with_noremap():with_silent():with_desc("tab: Only keep current tab"),
	-- Insert mode
	["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap():with_desc("edit: Delete previous block"),
	["i|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Move cursor to left"),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap():with_desc("edit: Move cursor to line start"),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_desc("edit: Save file"),
	["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"):with_desc("edit: Save file and quit"),

	["i|<A-z>"] = map_cmd("<esc>^i"):with_silent():with_desc("edit: go to head of current line"),
	["i|<A-m>"] = map_cmd("<esc>$a"):with_silent():with_desc("edit: go to end of current line"),
	["i|<C-j>"] = map_cmd("<Down>"):with_silent():with_desc("edit: go down"),
	["i|<C-k>"] = map_cmd("<Up>"):with_silent():with_desc("edit: go up"),
	["i|<C-l>"] = map_cmd("<Right>"):with_silent():with_desc("edit: go right"),
	["i|<C-f>"] = map_cmd("<Right>"):with_silent():with_desc("edit: go right"),
	-- Command mode
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
	["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("edit: End"),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
	-- ["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
		:with_noremap()
		:with_desc("edit: Complete path of current file"),
	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("edit: Move this line down"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("edit: Move this line up"),
	["v|<"] = map_cmd("<gv"):with_desc("edit: Decrease indent"),
	["v|>"] = map_cmd(">gv"):with_desc("edit: Increase indent"),
	["v|q"] = map_cmd("%"):with_desc("edit: % in v mode"),
}

bind.nvim_load_mapping(core_map)
