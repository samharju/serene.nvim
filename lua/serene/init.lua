local p = {
	green = "#698F3F",
	pink = "#C492b1",
	red = "#BC2c1A",
	purple = "#4F345a",
	beige = "#dbcfb0",
	white = "#ebfcfb",
	black = "#031120",
	yellow = "#C79F4B",
	blue = "#4B8CCD",
	aqua = "#97D7BD",

	cyan = "#7FB7BE",

	gray1 = "#303030",
	gray2 = "#4a4a4a",
	gray3 = "#636363",
	gray4 = "#7d7d7d",
	gray5 = "#979797",
	gray6 = "#b1b1b1",
	gray7 = "#cacaca",
	gray8 = "#e4e4e4",

	diffaddbg = "#1A2D27",
	diffchangebg = "#2E2E40",
	diffrembg = "#2c0c0c",

	lift = "#15222F",
	stl = "#0C1A28",

	errbg = "#18141F",
	warnbg = "#1F2526",
	infobg = "#14202D",
}

p.fg = p.gray7
p.bg = p.black
p.clbg = p.lift

local M = {}

function M.setup(opts)
	if opts.transparent then
		p.bg = "NONE"
	end
end

local function apply(l)
	for group, hl in pairs(l) do
		if hl.bg == nil then
			hl.bg = "NONE"
		end
		vim.api.nvim_set_hl(0, group, hl)
	end
end

function M.load(opts)
	if opts ~= nil then
		if opts.transparent then
			p.bg = "NONE"
			p.clbg = p.black
		else
			p.bg = p.black
			p.clbg = p.lift
		end
	end

	vim.cmd.hi("clear")

	vim.o.background = "dark"
	vim.opt.termguicolors = true
	vim.g.colors_name = "serene"

	apply({
		ColorColumn = { bg = p.gray1 },
		CurSearch = { fg = p.aqua, reverse = true },
		FoldColumn = { fg = p.gray3 },
		Cursor = { fg = p.bg, bg = p.fg },
		TermCursor = { link = "Cursor" },
		CursorColumn = { bg = p.lift },
		CursorLine = { bg = p.clbg },
		CursorLineNr = { fg = p.pink },
		lCursor = { fg = p.pink, bg = p.black },
		EndOfBuffer = { fg = p.gray1, bg = p.bg },
		IncSearch = { reverse = true },
		MatchParen = { bg = p.gray2 },
		Substitute = { fg = p.black, bg = p.pink },

		Normal = { fg = p.fg, bg = p.bg },
		NormalFloat = { fg = p.fg, bg = p.bg },
		Visual = { bg = p.lift },
		VisualNOS = { fg = p.black, bg = p.purple },

		ErrorMsg = { fg = p.red },
		MsgArea = { fg = p.beige },
		ModeMsg = { fg = p.blue },
		MoreMsg = { fg = p.green },
		WarningMsg = { fg = p.yellow },

		Conceal = { fg = p.gray4 },
		Directory = { fg = p.cyan },
		Folded = { bg = p.lift },
		LineNr = { fg = p.gray3 },
		NonText = { fg = p.gray3 },
		Whitespace = { fg = p.gray1 },

		Pmenu = { bg = p.lift },
		PmenuExtra = { fg = p.gray4, bg = p.lift },
		PmenuExtraSel = { fg = p.gray4, bg = p.lift },
		PmenuKind = { fg = p.red },
		PmenuKindSel = { fg = p.red },
		PmenuSbar = {},
		PmenuSel = { fg = p.aqua },
		PmenuThumb = { bg = p.gray5 },

		Question = { fg = p.white },
		QuickFixLine = { bg = p.diffchangebg },
		Search = { fg = p.white, bg = p.gray2 },
		SignColumn = {},
		SpecialKey = { fg = p.gray3 },
		SpellBad = {},
		SpellCap = {},
		SpellLocal = {},
		SpellRare = {},
		ToolbarButton = { fg = p.black, bg = p.white },
		WildMenu = { fg = p.black, bg = p.beige },

		debugBreakpoint = { fg = p.purple },
		debugPC = { fg = p.blue },

		diffSubname = { fg = p.pink },
		dirGroup = { fg = p.gray4 },
		dirOwner = { fg = p.gray4 },
		dirPermissionGroup = { fg = p.beige },
		dirPermissionOther = { fg = p.purple },
		dirPermissionUser = { fg = p.green },
		dirSize = { fg = p.beige },
		dirSizeMod = { fg = p.pink },
		dirTime = { fg = p.gray4 },
		dirType = { fg = p.pink },

		StatusLine = { fg = p.fg, bg = p.stl },
		StatusLineNC = { fg = p.gray4, bg = p.bg },
		TabLine = { fg = p.fg, bg = p.bg },
		TabLineFill = { bg = p.bg },
		TabLineSel = { fg = p.white, bg = p.black },
		WinBar = { fg = p.fg },
		WinBarNC = { fg = p.gray4 },
		WinSeparator = { fg = p.gray3, bg = p.black },

		Title = { fg = p.pink },

		-- syntax
		Comment = { fg = p.gray3 },

		Constant = { fg = p.pink },
		String = { fg = p.pink },
		Character = { link = "String" },
		Number = { fg = p.white },
		Boolean = { fg = p.white },
		Float = { fg = p.white },

		Identifier = { fg = p.gray6 },
		Function = { fg = p.beige },

		Statement = { fg = p.aqua },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { fg = p.gray6 },
		Operator = { fg = p.gray5 },
		Keyword = { fg = p.cyan },
		Exception = { link = "Keyword" },

		PreProc = { fg = p.aqua },
		Include = { link = "Keyword" },
		Define = { fg = p.red },
		Macro = { link = "PreProc" },
		PreCondit = { link = "PreProc" },

		Type = { fg = p.aqua },
		StorageClass = { link = "Type" },
		Structure = { link = "Type" },
		Typedef = { link = "Type" },

		Special = { fg = p.cyan, italic = true },
		SpecialChar = { link = "Special" },
		Tag = { link = "Special" },
		Delimiter = { fg = p.cyan },
		SpecialComment = { link = "Special" },
		Debug = { link = "Special" },

		Underlined = { underline = true },
		Ignore = {},
		Error = { fg = p.red },
		Todo = { fg = p.blue, bg = p.black },

		-- ts

		["@conceal"] = { link = "Conceal" },
		["@field"] = { fg = p.gray6, italic = true },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = p.aqua },
		["@parameter"] = { italic = true },
		["@punctuation.special"] = { fg = p.gray4 },
		["@tag.delimiter"] = { fg = p.gray4 },
		["@text.reference.vimdoc"] = { fg = p.pink },
		["@variable"] = { fg = p.gray7 },
		["@variable.builtin"] = { fg = p.aqua },

		-- diags

		DiagnosticError = { fg = p.red },
		DiagnosticHint = { fg = p.gray3 },
		DiagnosticInfo = { fg = p.gray5 },
		DiagnosticOk = { fg = p.green },
		DiagnosticVirtualTextError = { fg = p.red, bg = p.errbg, italic = true },
		DiagnosticVirtualTextHint = { fg = p.gray3, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.gray5, bg = p.infobg, italic = true },
		DiagnosticVirtualTextOk = { fg = p.green, bg = p.lift, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.warnbg, italic = true },
		DiagnosticWarn = { fg = p.yellow },

		-- git
		-- sign hl type stuff
		Added = { fg = p.green },
		DiffAdded = { link = "Added" },
		Removed = { fg = p.red },
		DiffRemoved = { link = "Removed" },
		Changed = { fg = p.pink },
		DiffChanged = { link = "Changed" },

		-- line hl type stuff

		DiffAdd = { bg = p.diffaddbg },
		DiffChange = { bg = p.diffchangebg },
		DiffDelete = { bg = p.diffrembg },
		DiffText = { bg = p.purple },

		---------------------------------------------------- plugins

		-- gitsigns
		GitSignsAddInline = { link = "DiffText" },
		GitSignsChangeInline = { link = "DiffText" },
		GitSignsDeleteInline = { link = "DiffText" },

		-- fugitive
		fugitiveStagedHeading = { fg = p.aqua },
		fugitiveStagedModifier = { fg = p.aqua },
		fugitiveUnstagedHeading = { fg = p.pink },
		fugitiveUnstagedModifier = { fg = p.red },
		fugitiveUntrackedHeading = { fg = p.pink },
		fugitiveUntrackedModifier = { fg = p.red },
		gitHashAbbrev = { fg = p.yellow },

		-- cmp
		CmpItemKind = { fg = p.gray5 },
		CmpItemKindClass = { link = "Type" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindKeyword = { link = "Keyword" },
		CmpItemKindModule = { link = "Include" },
		CmpItemKindSnippet = { link = "Define" },
		CmpItemKindText = { link = "Comment" },
		CmpItemKindVariable = { link = "Identifier" },

		-- copilot
		CopilotSuggestion = { fg = p.gray2, italic = true },
	})
end

return M
