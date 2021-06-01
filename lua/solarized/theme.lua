local solarized = require("moonlight.colors")

local theme = {}

theme.loadSyntax = function ()
    -- Syntax highlight groups

	local syntax = {
		Type =						{ fg = solarized.purple }, -- int, long, char, etc.
		StorageClass =				{ fg = solarized.cyan }, -- static, register, volatile, etc.
		Structure =					{ fg = solarized.puple }, -- struct, union, enum, etc.
		Constant =					{ fg = solarized.yellow }, -- any constant
		String =					{ fg = solarized.green, bg = moonlight.none, style= 'italic' }, -- Any string
		Character =					{ fg = solarized.orange }, -- any character constant: 'c', '\n'
		Number =					{ fg = solarized.orange }, -- a number constant: 5
		Boolean =					{ fg = solarized.orange }, -- a boolean constant: TRUE, false
		Float =						{ fg = solarized.orange }, -- a floating point constant: 2.3e10
		Statement =					{ fg = solarized.pink }, -- any statement
		Label =						{ fg = solarized.purple }, -- case, default, etc.
		Operator =					{ fg = solarized.cyan }, -- sizeof", "+", "*", etc.
		Exception =					{ fg = solarized.cyan }, -- try, catch, throw
		PreProc =					{ fg = solarized.purple }, -- generic Preprocessor
		Include =					{ fg = solarized.blue }, -- preprocessor #include
		Define =					{ fg = solarized.pink }, -- preprocessor #define
		Macro =						{ fg = solarized.cyan }, -- same as Define
		Typedef =					{ fg = solarized.red }, -- A typedef
		PreCondit =					{ fg = solarized.cyan }, -- preprocessor #if, #else, #endif, etc.
		Special =					{ fg = solarized.red }, -- any special symbol
		SpecialChar =				{ fg = solarized.pink }, -- special character in a constant
		Tag =						{ fg = solarized.red }, -- you can use CTRL-] on this
		Delimiter =					{ fg = solarized.cyan }, -- character that needs attention like , or .
		SpecialComment =			{ fg = solarized.gray }, -- special things inside a comment
		Debug =						{ fg = solarized.red }, -- debugging statements
		Underlined =				{ fg = solarized.link, bg = moonlight.none, style = 'underline' }, -- text that stands out, HTML links
		Ignore =					{ fg = solarized.disabled }, -- left blank, hidden
		Error =						{ fg = solarized.error, bg = moonlight.none, style = 'bold,underline' }, -- any erroneous construct
		Todo =						{ fg = solarized.yellow, bg = moonlight.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink = { fg = solarized.link, style = "underline" },
        htmlH1 = { fg = solarized.cyan, style = "bold" },
        htmlH2 = { fg = solarized.red, style = "bold" },
        htmlH3 = { fg = solarized.green, style = "bold" },
        htmlH4 = { fg = solarized.yellow, style = "bold" },
        htmlH5 = { fg = solarized.purple, style = "bold" },
        markdownH1 = { fg = solarized.cyan, style = "bold" },
        markdownH2 = { fg = solarized.red, style = "bold" },
        markdownH3 = { fg = solarized.green, style = "bold" },
        markdownH1Delimiter = { fg = solarized.cyan },
        markdownH2Delimiter = { fg = solarized.red },
        markdownH3Delimiter = { fg = solarized.green },
	}

	-- Options:

	-- Italic comments
	if vim.g.solarized_italic_comments == true then
		syntax.Comment =		{fg = solarized.comments, bg = moonlight.none, style = 'italic'} -- italic comments
	else
		syntax.Comment =		{fg = solarized.comments} -- normal comments
	end

	-- Italic Keywords
	if vim.g.solarized_italic_keywords == true then
		syntax.Conditional =		{fg = solarized.purple, bg = moonlight.none, style = 'italic'} -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = solarized.purple, bg = moonlight.none, style = 'italic'} -- italic for, do, while, etc.
		syntax.Repeat =				{fg = solarized.purple, bg = moonlight.none, style = 'italic'} -- italic any other keyword
	else
		syntax.Conditional =		{fg = solarized.purple} -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = solarized.purple} -- normal for, do, while, etc.
		syntax.Repeat =				{fg = solarized.purple} -- normal any other keyword
	end

	-- Italic Function names
	if vim.g.solarized_italic_functions == true then
		syntax.Function =		{fg = solarized.blue, bg = moonlight.none, style = 'italic'} -- italic funtion names
	else
		syntax.Function =		{fg = solarized.blue} -- normal function names
	end

	if vim.g.solarized_italic_variables == true then
		Identifier =				{fg = solarized.gray, bg = moonlight.none, style = 'italic'}; -- any variable name
    else
		Identifier =				{fg = solarized.gray}; -- any variable name
    end

    return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

	local editor = {
		NormalFloat =			{ fg = solarized.fg, bg = moonlight.float }, -- normal text and background color
		ColorColumn =			{ fg = solarized.none, bg = moonlight.active }, --  used for the columns set with 'colorcolumn'
		Conceal =				{ fg = solarized.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor =				{ fg = solarized.cursor, bg = moonlight.none, style = 'reverse' }, -- the character under the cursor
		CursorIM =				{ fg = solarized.cursor, bg = moonlight.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
		Directory =				{ fg = solarized.blue, bg = moonlight.none }, -- directory names (and other special names in listings)
		DiffAdd =				{ fg = solarized.green, bg = moonlight.none, style = 'reverse' }, -- diff mode: Added line
		DiffChange =			{ fg = solarized.orange, bg = moonlight.none, style = 'reverse' }, --  diff mode: Changed line
		DiffDelete =			{ fg = solarized.red, bg = moonlight.none, style = 'reverse' }, -- diff mode: Deleted line
		DiffText =				{ fg = solarized.yellow, bg = moonlight.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
		EndOfBuffer =			{ fg = solarized.disabled },
		ErrorMsg =				{ fg = solarized.none },
		Folded =				{ fg = solarized.disabled, bg = moonlight.none, style = 'italic' },
		FoldColumn =			{ fg = solarized.blue },
		IncSearch =				{ fg = solarized.highlight, bg = moonlight.white, style = 'reverse' },
		LineNr =				{ fg = solarized.line_numbers },
		CursorLineNr =			{ fg = solarized.accent },
		MatchParen =			{ fg = solarized.yellow, bg = moonlight.none, style = 'bold' },
		ModeMsg =				{ fg = solarized.accent },
		MoreMsg =				{ fg = solarized.accent },
		NonText =				{ fg = solarized.disabled },
		Pmenu =					{ fg = solarized.text, bg = moonlight.contrast },
		PmenuSel =				{ fg = solarized.accent, bg = moonlight.active },
		PmenuSbar =				{ fg = solarized.text, bg = moonlight.contrast },
		PmenuThumb =			{ fg = solarized.fg, bg = moonlight.accent },
		Question =				{ fg = solarized.green },
		QuickFixLine =			{ fg = solarized.highlight, bg = moonlight.white, style = 'reverse' },
		qfLineNr =				{ fg = solarized.highlight, bg = moonlight.white, style = 'reverse' },
		Search =				{ fg = solarized.highlight, bg = moonlight.white, style = 'reverse' },
		SpecialKey =			{ fg = solarized.purple },
		SpellBad =				{ fg = solarized.red, bg = moonlight.none, style = 'italic,undercurl' },
		SpellCap =				{ fg = solarized.blue, bg = moonlight.none, style = 'italic,undercurl' },
		SpellLocal =			{ fg = solarized.cyan, bg = moonlight.none, style = 'italic,undercurl' },
		SpellRare =				{ fg = solarized.purple, bg = moonlight.none, style = 'italic,undercurl' },
		StatusLine =			{ fg = solarized.fg, bg = moonlight.contrast },
		StatusLineNC =  		{ fg = solarized.text, bg = moonlight.disabled },
		StatusLineTerm =		{ fg = solarized.fg, bg = moonlight.contrast },
		StatusLineTermNC =		{ fg = solarized.text, bg = moonlight.disabled },
		TabLineFill =			{ fg = solarized.fg },
		TablineSel =			{ fg = solarized.bg, bg = moonlight.accent },
		Tabline =				{ fg = solarized.fg },
		Title =					{ fg = solarized.green, bg = moonlight.none, style = 'bold' },
		Visual =				{ fg = solarized.none, bg = moonlight.selection },
		VisualNOS =				{ fg = solarized.none, bg = moonlight.selection },
		WarningMsg =			{ fg = solarized.yellow },
		WildMenu =				{ fg = solarized.orange, bg = moonlight.none, style = 'bold' },
		CursorColumn =			{ fg = solarized.none, bg = moonlight.active },
		CursorLine =			{ fg = solarized.none, bg = moonlight.none },
		ToolbarLine =			{ fg = solarized.fg, bg = moonlight.bg_alt },
		ToolbarButton =			{ fg = solarized.fg, bg = moonlight.none, style = 'bold' },
		NormalMode =			{ fg = solarized.accent, bg = moonlight.none, style = 'reverse' },
		InsertMode =			{ fg = solarized.green, bg = moonlight.none, style = 'reverse' },
		ReplacelMode =			{ fg = solarized.red, bg = moonlight.none, style = 'reverse' },
		VisualMode =			{ fg = solarized.purple, bg = moonlight.none, style = 'reverse' },
		CommandMode =			{ fg = solarized.gray, bg = moonlight.none, style = 'reverse' },
		Warnings =				{ fg = solarized.yellow },

        healthError =           { fg = solarized.error },
        healthSuccess =         { fg = solarized.green },
        healthWarning =         { fg = solarized.yellow },

        -- Dashboard
        DashboardShortCut =                     { fg = solarized.blue },
        DashboardHeader =                       { fg = solarized.red },
        DashboardCenter =                       { fg = solarized.cyan },
        DashboardFooter =                       { fg = solarized.green, style = "italic" },

	}

    -- Options:

    --Set transparent background
    if vim.g.solarized_disable_background == true then
		editor.Normal =				{ fg = solarized.fg, bg = moonlight.none } -- normal text and background color
		editor.SignColumn =			{ fg = solarized.fg, bg = moonlight.none }
    else
		editor.Normal =				{ fg = solarized.fg, bg = moonlight.bg } -- normal text and background color
		editor.SignColumn =			{ fg = solarized.fg, bg = moonlight.bg }
    end

    -- Remove window split borders
    if vim.g.solarized_borders == true then
		editor.VertSplit =				{ fg = solarized.border }
    else
		editor.VertSplit =				{ fg = solarized.bg }
    end

    return editor
end

theme.loadTerminal = function ()

	vim.g.terminal_color_0 = solarized.black
	vim.g.terminal_color_1 = solarized.red
	vim.g.terminal_color_2 = solarized.green
	vim.g.terminal_color_3 = solarized.yellow
	vim.g.terminal_color_4 = solarized.blue
	vim.g.terminal_color_5 = solarized.purple
	vim.g.terminal_color_6 = solarized.cyan
	vim.g.terminal_color_7 = solarized.white
	vim.g.terminal_color_8 = solarized.gray
	vim.g.terminal_color_9 = solarized.red
	vim.g.terminal_color_10 = solarized.green
	vim.g.terminal_color_11 = solarized.yellow
	vim.g.terminal_color_12 = solarized.blue
	vim.g.terminal_color_13 = solarized.purple
	vim.g.terminal_color_14 = solarized.cyan
	vim.g.terminal_color_15 = solarized.white

end

theme.loadTreeSitter = function ()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation =              { fg = solarized.red },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute =               { fg = solarized.yellow },    -- (unstable) TODO: docs
        TSBoolean=                  { fg = solarized.orange },    -- For booleans.
        TSCharacter=                { fg = solarized.orange },    -- For characters.
        TSConstructor =             { fg = solarized.purple }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant =                { fg = solarized.yellow },    -- For constants
        TSConstBuiltin =            { fg = solarized.blue },    -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro =              { fg = solarized.blue },    -- For constants that are defined by macros: `NULL` in C.
        TSError =                   { fg = solarized.error },    -- For syntax/parser errors.
        TSException =               { fg = solarized.yellow },    -- For exception related keywords.
        TSField =                   { fg = solarized.gray }, -- For fields.
        TSFloat =                   { fg = solarized.red },    -- For floats.
        TSFuncMacro =               { fg = solarized.blue },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =                 { fg = solarized.cyan },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =                   { fg = solarized.red }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =               { fg = solarized.yellow },    -- For identifiers referring to modules and namespaces.
        --TSNone =                    { },    -- TODO: docs
        TSNumber =                  { fg = solarized.orange },    -- For all numbers
        TSOperator =                { fg = solarized.cyan }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =               { fg = solarized.paleblue }, -- For parameters of a function.
        TSParameterReference=       { fg = solarized.paleblue },    -- For references to parameters of a function.
        TSProperty =                { fg = solarized.paleblue }, -- Same as `TSField`.
        TSPunctDelimiter =          { fg = solarized.cyan }, -- For delimiters ie: `.`
        TSPunctBracket =            { fg = solarized.cyan }, -- For brackets and parens.
        TSPunctSpecial =            { fg = solarized.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSString =                  { fg = solarized.green },    -- For strings.
        TSStringRegex =             { fg = solarized.blue }, -- For regexes.
        TSStringEscape =            { fg = solarized.disabled }, -- For escape characters within a string.
        TSSymbol =                  { fg = solarized.yellow },    -- For identifiers referring to symbols or atoms.
        TSType =                    { fg = solarized.purple },    -- For types.
        TSTypeBuiltin =             { fg = solarized.purple },    -- For builtin types.
        TSTag =                     { fg = solarized.red },    -- Tags like html tag names.
        TSTagDelimiter =            { fg = solarized.yellow },    -- Tag delimiter like `<` `>` `/`
        TSText =                    { fg = solarized.text },    -- For strings considered text in a markup language.
        TSTextReference =           { fg = solarized.yellow }, -- FIXME
        TSEmphasis =                { fg = solarized.paleblue },    -- For text to be represented with emphasis.
        TSUnderline =               { fg = solarized.fg, bg = moonlight.none, style = 'underline' },    -- For text to be represented with an underline.
        TSStrike =                  { },    -- For strikethrough text.
        TSTitle =                   { fg = solarized.paleblue, bg = moonlight.none, style = 'bold' },    -- Text that is part of a title.
        TSLiteral =                 { fg = solarized.fg },    -- Literal text.
        TSURI =                     { fg = solarized.link },    -- Any URI like a link or email.
    }

    -- Options:

    -- Italic comments
    if vim.g.solarized_italic_comments == true then
        treesitter.TSComment=                  { fg = solarized.comments , bg = moonlight.none, style = 'italic' }    -- For comment blocks.
    else
        treesitter.TSComment=                  { fg = solarized.comments }    -- For comment blocks.
    end

    if vim.g.solarized_italic_keywords == true then
        treesitter.TSConditional =             { fg = solarized.purple, style = 'italic' }    -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = solarized.purple, style = 'italic' } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = solarized.purple, style = 'italic' }    -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = solarized.purple, style = 'italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional =             { fg = solarized.purple }    -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = solarized.purple } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = solarized.purple }    -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = solarized.purple } -- For keywords used to define a fuction.
    end

    if vim.g.solarized_italic_functions == true then
        treesitter.TSFunction =                { fg = solarized.blue, style = 'italic' }    -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = solarized.blue, style = 'italic' }    -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = solarized.cyan, style = 'italic' }    -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction =                { fg = solarized.blue }    -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = solarized.blue }    -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = solarized.cyan }    -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.solarized_italic_variables == true then
        treesitter.TSVariable =                { fg = solarized.gray, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = solarized.gray, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable =                { fg = solarized.gray } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = solarized.gray } -- Variable names that are defined by the languages, like `this` or `self`.
    end

    return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError =            { fg = solarized.error }, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError =               { fg = solarized.error }, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError =           { fg = solarized.error }, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError =        { fg = solarized.error }, -- Virtual text "Error"
        LspDiagnosticsUnderlineError =          { style = 'undercurl', sp = solarized.error }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning =          { fg = solarized.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning =             { fg = solarized.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning =         { fg = solarized.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning =      { fg = solarized.yellow}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning =        { style = 'undercurl', sp = solarized.yellow }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation =      { fg = solarized.paleblue }, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation =         { fg = solarized.paleblue },  -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation =     { fg = solarized.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation =  { fg = solarized.paleblue }, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation =    { style = 'undercurl', sp = solarized.paleblue }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint =             { fg = solarized.purple  },  -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint =                { fg = solarized.purple  }, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint =            { fg = solarized.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint =         { fg = solarized.purple  }, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint =           { style = 'undercurl', sp = solarized.paleblue }, -- used to underline "Hint" diagnostics.
        LspReferenceText =                      { fg = solarized.accent, bg = moonlight.highlight }, -- used for highlighting "text" references
        LspReferenceRead =                      { fg = solarized.accent, bg = moonlight.highlight }, -- used for highlighting "read" references
        LspReferenceWrite =                     { fg = solarized.accent, bg = moonlight.highlight }, -- used for highlighting "write" references
    }

    return lsp

end

theme.loadPlugins = function()
    -- Plugins highlight groups

    local plugins = {

        -- LspTrouble
        LspTroubleText =                        { fg = solarized.text },
        LspTroubleCount =                       { fg = solarized.purple, bg = moonlight.active },
        LspTroubleNormal =                      { fg = solarized.fg, bg = moonlight.sidebar },

        -- Diff
        diffAdded =                             { fg = solarized.green },
        diffRemoved =                           { fg = solarized.red },
        diffChanged =                           { fg = solarized.yellow },
        diffOldFile =                           { fg = solarized.yelow },
        diffNewFile =                           { fg = solarized.orange },
        diffFile =                              { fg = solarized.blue },
        diffLine =                              { fg = solarized.comments },
        diffIndexLine =                         { fg = solarized.purple },

        -- Neogit
        NeogitBranch =                          { fg = solarized.paleblue },
        NeogitRemote =                          { fg = solarized.purple },
        NeogitHunkHeader =                      { fg = solarized.fg, bg = moonlight.highlight },
        NeogitHunkHeaderHighlight =             { fg = solarized.blue, bg = moonlight.contrast },
        NeogitDiffContextHighlight =            { fg = solarized.text, bg = moonlight.contrast },
        NeogitDiffDeleteHighlight =             { fg = solarized.red },
        NeogitDiffAddHighlight =                { fg = solarized.green },

        -- GitGutter
        GitGutterAdd =                          { fg = solarized.green }, -- diff mode: Added line |diff.txt|
        GitGutterChange =                       { fg = solarized.yellow }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete =                       { fg = solarized.red }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd =                           { fg = solarized.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr =                         { fg = solarized.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn =                         { fg = solarized.green }, -- diff mode: Added line |diff.txt|
        GitSignsChange =                        { fg = solarized.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr =                      { fg = solarized.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn =                      { fg = solarized.yellow }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete =                        { fg = solarized.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr =                      { fg = solarized.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn =                      { fg = solarized.red }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopePromptBorder =                 { fg = solarized.cyan },
        TelescopeResultsBorder =                { fg = solarized.purple },
        TelescopePreviewBorder =                { fg = solarized.green },
        TelescopeSelectionCaret =               { fg = solarized.purple },
        TelescopeSelection =                    { fg = solarized.purple },
        TelescopeMatching =                     { fg = solarized.cyan },
        TelescopeNormal =                       { fg = solarized.fg, bg = moonlight.float },

        -- NvimTree
        NvimTreeRootFolder =                    { fg = solarized.blue, style = "bold" },
        NvimTreeGitDirty =                      { fg = solarized.yellow },
        NvimTreeGitNew =                        { fg = solarized.green },
        NvimTreeImageFile =                     { fg = solarized.yellow },
        NvimTreeExecFile =                      { fg = solarized.green },
        NvimTreeSpecialFile =                   { fg = solarized.purple , style = "underline" },
        NvimTreeFolderName=                     { fg = solarized.paleblue },
        NvimTreeEmptyFolderName=                { fg = solarized.disabled },
        NvimTreeFolderIcon=                     { fg = solarized.accent },
        NvimTreeIndentMarker =                  { fg  = solarized.disabled },
        LspDiagnosticsError =                   { fg = solarized.error },
        LspDiagnosticsWarning =                 { fg = solarized.yellow },
        LspDiagnosticsInformation =             { fg = solarized.paleblue },
        LspDiagnosticsHint =                    { fg = solarized.purple },

        -- WhichKey
        WhichKey =                              { fg = solarized.accent , style = 'bold'},
        WhichKeyGroup =                         { fg = solarized.text },
        WhichKeyDesc =                          { fg = solarized.blue, style = 'italic' },
        WhichKeySeperator =                     { fg = solarized.fg },
        WhichKeyFloating =                      { bg = solarized.float },
        WhichKeyFloat =                         { bg = solarized.float },

        -- LspSaga
        DiagnosticError =                       { fg = solarized.error },
        DiagnosticWarning =                     { fg = solarized.yellow },
        DiagnosticInformation =                 { fg = solarized.paleblue },
        DiagnosticHint =                        { fg = solarized.purple },
        DiagnosticTruncateLine =                { fg = solarized.fg },
        LspFloatWinNormal =                     { bg = solarized.contrast },
        LspFloatWinBorder =                     { fg = solarized.purple },
        LspSagaBorderTitle =                    { fg = solarized.cyan },
        LspSagaHoverBorder =                    { fg = solarized.paleblue },
        LspSagaRenameBorder =                   { fg = solarized.green },
        LspSagaDefPreviewBorder =               { fg = solarized.green },
        LspSagaCodeActionBorder =               { fg = solarized.blue },
        LspSagaFinderSelection =                { fg = solarized.green },
        LspSagaCodeActionTitle =                { fg = solarized.paleblue },
        LspSagaCodeActionContent =              { fg = solarized.purple },
        LspSagaSignatureHelpBorder =            { fg = solarized.pink },
        ReferencesCount =                       { fg = solarized.purple },
        DefinitionCount =                       { fg = solarized.purple },
        DefinitionIcon =                        { fg = solarized.blue },
        ReferencesIcon =                        { fg = solarized.blue },
        TargetWord =                            { fg = solarized.cyan },

        -- BufferLine
        BufferLineIndicatorSelected =           { fg = solarized.accent },
        BufferLineFill =                        { bg = solarized.bg_alt },

        -- Sneak
        Sneak =                                 { fg = solarized.bg, bg = moonlight.accent },
        SneakScope =                            { bg = solarized.selection },

        -- Indent Blankline
        IndentBlanklineChar =                   { fg = solarized.highlight },
        IndentBlanklineContextChar =            { fg = solarized.disabled },
	
	 -- Nvim dap
         DapBreakpoint =                         { fg = solarized.red },
         DapStopped =                            { fg = solarized.green },
    }

    -- Options:

    -- Disable nvim-tree background
        if vim.g.solarized_disable_background == true then
            plugins.NvimTreeNormal =                        { fg = solarized.fg, bg = moonlight.none }
        else
            plugins.NvimTreeNormal =                        { fg = solarized.fg, bg = moonlight.sidebar }
        end

    return plugins

end

return theme
