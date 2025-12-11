-- owned by spite897
-- require("full-border"):setup({ type = ui.Border.PLAIN }) -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED -- require("yaziline"):setup()

require("git"):setup()

-- ======== EVERYTHING about yaziline  ========
--[[
require("yaziline"):setup {
	separator_style = "curvy",
	select_symbol = "",
	yank_symbol = "󰆐",
	filename_max_length = 24, -- trim when filename > 24
	filename_trim_length = 6 -- trim 6 chars from both ends
}
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ui.Line {}
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	}
end, 500, Status.RIGHT)
--]]

-- ======== EVERYTHING about yamb  ========
--[[
-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = os.getenv("HOME")
table.insert(bookmarks, {
  tag = "Desktop",
  path = home_path .. path_sep .. "Desktop" .. path_sep,
  key = "d"
})

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
--]]

-- ======== EVERYTHING about eza-preview  ========
---[[
require("eza-preview"):setup({
  -- Set the tree preview to be default (default: true)
  default_tree = false,
  -- Directory depth level for tree preview (default: 3)
  level = 3,
  -- Show file icons
  icons = true,
  -- Follow symlinks when previewing directories (default: true)
  follow_symlinks = true,
  -- Show target file info instead of symlink info (default: false)
  dereference = false,
  -- Show hidden files (default: true)
  all = true,

  -- Ignore files matching patterns (default: {})
  -- ignore_glob = "*.log"
  -- ignore_glob = { "*.tmp", "node_modules", ".git", ".DS_Store" }
  -- SEE: https://www.linuxjournal.com/content/pattern-matching-bash to learn about glob patterns
  ignore_glob = {},

  -- Ignore files mentioned in '.gitignore'  (default: true)
  git_ignore = true,

  -- Show git status (default: false)
  git_status = false
})
--]]

-- ======== EVERYTHING about yatline ========
---[[

--- @param flavor string Flavor of the theme: "latte", "frappe", "macchiato" or "mocha".
local yatline_theme_catppuccin = require("yatline-theme-catppuccin"):setup("macchiato") 

require("yatline"):setup({ 
    theme = yatline_theme_catppuccin,

    section_separator = { open = "", close = "" }, 
    part_separator = { open = "│", close = "│" }, 
    show_background = true,

    header_line = {
		left = {
            section_a = { {type = "line", custom = false, name = "tabs", params = {"left"}},},
			section_b = {},
			section_c = {}
		},
		right = { 
            section_a = { 
                    {type = "string", custom = false, name = "date", params = {"%H:%M"}},
            },
			section_b = {
                    {type = "string", custom = false, name = "date", params = {"%y%m%d-%a"}},
            },
			section_c = {
                    {type = "coloreds", custom = false, name = "count", params = "true"},
                    --{type = "coloreds", custom = false, name = "page_count"}
            }
		}
	},
	status_line = { 
        left = { 
            section_a = { {type = "string", custom = false, name = "tab_mode"},},
			section_b = { 
                {type = "string", custom = false, name = "tab_path", params = {{ trimed = false, max_length=24, trim_length=10 }},}
            },
			section_c = { 
                {type = "coloreds", custom = false, name = "task_workload"},
                {type = "coloreds", custom = false, name = "task_states"},
		    },
        }, 
		right = { 
            section_a = { {type = "string", custom = false, name = "cursor_position"},},
			section_b = {
                {type = "string", custom = false, name = "hovered_size"},
            },
			section_c = {
                {type = "coloreds", custom = false, name = "githead"},
            }
		}
	},
})
--[[
{type = "string", custom = true, name = "SPITE's MSG"}
{type = "string", custom = false, name = "hovered_name", params = {{ trimed = false, show_symlink = false, max_length=24, trim_length=10 }},}
{type = "string", custom = false, name = "hovered_path", params = {{ trimed = false, max_length=24, trim_length=10 }},
{type = "string", custom = false, name = "hovered_size"},
{type = "string", custom = false, name = "hovered_mime"},
{type = "string", custom = false, name = "hovered_ownership"},
{type = "string", custom = false, name = "hovered_file_extension"},
{type = "string", custom = false, name = "tab_path", params = {{ trimed = false, max_length=24, trim_length=10 }},
{type = "string", custom = false, name = "tab_mode"},
{type = "string", custom = false, name = "tab_num_files"},
{type = "string", custom = false, name = "cursor_percentage"},
{type = "string", custom = false, name = "date", params = {"%A, %d %B %Y"}},

{type = "coloreds", custom = true, name = {{"Hello ", "red"}, {"World", "green"}}},
{type = "coloreds", custom = false, name = "permissions"},
{type = "coloreds", custom = false, name = "count", params = "true"},
{type = "coloreds", custom = false, name = "task_states"},
{type = "coloreds", custom = false, name = "task_workload"},
{type = "coloreds", custom = false, name = "string_based_component", params = {"date", "blue", {"%A, %d %B %Y"}}},

{type = "line", custom = true, name = custom_line},
{type = "line", custom = false, name = "tabs", params = {"left"}},
--]]

require("yatline-page-counter"):setup({
        page_color = "cyan",           -- Color for page count display
        show_icon = false,              -- Show document icon (default: true)
        icon = "",                   -- Icon to display (default: 📄)
        supported_formats = {          -- File extensions to check
                "pdf", "djvu", "epub", "mobi", "azw", "azw3",
                "docx", "doc", "odt", "pptx", "ppt", "odp"
    }
})
require("yatline-githead"):setup({
  theme = yatline_theme_catppuccin,
  show_branch = true,
  branch_prefix = "on",
  branch_symbol = "",
  branch_borders = "()",

  commit_symbol = "@",

  show_behind_ahead = true,
  behind_symbol = "⇣",
  ahead_symbol = "⇡",

  show_stashes = true,
  stashes_symbol = "$",

  show_state = true,
  show_state_prefix = true,
  state_symbol = "~",

  show_staged = true,
  staged_symbol = "+",

  show_unstaged = true,
  unstaged_symbol = "!",

  show_untracked = true,
  untracked_symbol = "?",
})

--]]
