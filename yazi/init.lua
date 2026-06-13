-- Yazi initialization
-- https://yazi-rs.github.io/docs/configuration/overview

-- UI polish
require("full-border"):setup {
	type = ui.Border.ROUNDED,
}

-- Smarter open behavior. Keep multi-select opens enabled.
require("smart-enter"):setup {
	open_multi = true,
}

-- Git status in file list linemode.
th.git = th.git or {}
th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.untracked_sign = "?"
th.git.ignored_sign = "I"
th.git.deleted_sign = "D"
th.git.updated_sign = "U"
th.git.clean_sign = ""

require("git"):setup {
	order = 1500,
}

-- Show symlink target in the status bar.
Status:children_add(function(self)
	local h = self._current.hovered
	return h and h.link_to and " -> " .. tostring(h.link_to) or ""
end, 3300, Status.LEFT)

-- Show owner/group in the status bar on Unix.
Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)
