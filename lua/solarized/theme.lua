local solarized = require('solarized.colors')

local ts = require('solarized.treesitter')

local theme = {}

theme.loadSyntax = function()
    -- Syntax highlight groups

    local syntax = {
        Statement           = { fg = solarized.gray },      -- any statement
        Ignore              = { fg = solarized.disabled },  -- left blank, hidden

        Structure           = ts['@namespace'],             -- struct, union, enum, etc.
        Typedef             = ts['@type.definition'],       -- A typedef

        Type                = ts['@type'],                  -- int, long, char, etc.
        StorageClass        = ts['@storageclass'],          -- static, register, volatile, etc.
        Constant            = ts['@constant'],              -- any constant
        String              = ts['@string'],                -- Any string
        Character           = ts['@character'],             -- any character constant: 'c', '\n'
        Number              = ts['@number'],                -- a number constant: 5
        Boolean             = ts['@boolean'],               -- a boolean constant: TRUE, false
        Float               = ts['@float'],                 -- a floating point constant: 2.3e10
        Label               = ts['@label'],                 -- case, default, etc.
        Operator            = ts['@operator'],              -- sizeof", "+", "*", etc.
        Exception           = ts['@exception'],             -- try, catch, throw
        PreProc             = ts['@preproc'],               -- generic Preprocessor
        Include             = ts['@include'],               -- preprocessor #include
        Define              = ts['@define'],                -- preprocessor #define
        Macro               = ts['@function.macro'],
        PreCondit           = ts['@conditional'],           -- preprocessor #if, #else, #endif, etc.
        Special             = ts['@string.special'],        -- any special symbol
        SpecialChar         = ts['@character.special'],     -- special character in a constant
        Tag                 = ts['@tag'],                   -- you can use CTRL-] on this
        Delimiter           = ts['@punctuation.delimiter'], -- character that needs attention like , or .
        SpecialComment      = ts['@comment.documentation'], -- special things inside a comment
        Debug               = ts['@debug'],                 -- debugging statements
        Underlined          = ts['@text.underline'],        -- text that stands out, HTML links
        Error               = ts['@error'],                 -- any erroneous construct
        Todo                = ts['@text.todo'],             -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink            = { fg = solarized.link, style = 'underline' },
        htmlH1              = { fg = solarized.cyan, style = 'bold' },
        htmlH2              = { fg = solarized.red, style = 'bold' },
        htmlH3              = { fg = solarized.green, style = 'bold' },
        htmlH4              = { fg = solarized.purple, style = 'bold' },
        htmlH5              = { fg = solarized.yellow, style = 'bold' },
        markdownH1          = { fg = solarized.cyan, style = 'bold' },
        markdownH2          = { fg = solarized.red, style = 'bold' },
        markdownH3          = { fg = solarized.green, style = 'bold' },
        markdownH1Delimiter = { fg = solarized.cyan },
        markdownH2Delimiter = { fg = solarized.red },
        markdownH3Delimiter = { fg = solarized.green },
    }

    -- Options:

    -- Italic comments
    if vim.g.solarized_italic_comments == true then
        syntax.Comment = { fg = solarized.comments, bg = solarized.none, style = 'italic' } -- italic comments
    else
        syntax.Comment = ts['@comment'];                                                    -- normal comments
    end

    -- Italic Keywords
    if vim.g.solarized_italic_keywords == true then
        syntax.Conditional = { fg = solarized.yellow, bg = solarized.none, style = 'italic' } -- italic if, then, else, endif, switch, etc.
        syntax.Keyword     = { fg = solarized.yellow, bg = solarized.none, style = 'italic' } -- italic for, do, while, etc.
        syntax.Repeat      = { fg = solarized.yellow, bg = solarized.none, style = 'italic' } -- italic any other keyword
    else
        syntax.Conditional = ts['@conditional'];                                              -- normal if, then, else, endif, switch, etc.
        syntax.Keyword     = ts['@keyword'];                                                  -- normal for, do, while, etc.
        syntax.Repeat      = ts['@repeat'];                                                   -- normal any other keyword
    end

    -- Italic Function names
    if vim.g.solarized_italic_functions == true then
        syntax.Function = { fg = solarized.blue, bg = solarized.none, style = 'italic' } -- italic funtion names
    else
        syntax.Function = ts['function']                                                 -- normal function names
    end

    if vim.g.solarized_italic_variables == true then
        syntax.Identifier = { fg = solarized.gray, bg = solarized.none, style = 'italic' }; -- any variable name
    else
        syntax.Identifier = ts['@variable'];                                                -- any variable name
    end

    return syntax
end


theme.loadEditor = function()
    -- Editor highlight groups

    local editor = {
        NormalFloat       = { fg = solarized.fg, bg = solarized.float },                       -- normal text and background color
        ColorColumn       = { fg = solarized.none, bg = solarized.active },                    --  used for the columns set with 'colorcolumn'
        Conceal           = { fg = solarized.disabled },                                       -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor            = { fg = solarized.cursor, bg = solarized.none, style = 'reverse' }, -- the character under the cursor
        CursorIM          = { fg = solarized.cursor, bg = solarized.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
        Directory         = { fg = solarized.blue, bg = solarized.none },                      -- directory names (and other special names in listings)
        DiffAdd           = { fg = solarized.green, bg = solarized.none, style = 'reverse' },  -- diff mode: Added line
        DiffChange        = { fg = solarized.orange, bg = solarized.none, style = 'reverse' }, --  diff mode: Changed line
        DiffDelete        = { fg = solarized.red, bg = solarized.none, style = 'reverse' },    -- diff mode: Deleted line
        DiffText          = { fg = solarized.purple, bg = solarized.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
        EndOfBuffer       = { fg = solarized.disabled },
        ErrorMsg          = { fg = solarized.none },
        Folded            = { fg = solarized.disabled, bg = solarized.none, style = 'italic' },
        FoldColumn        = { fg = solarized.blue },
        IncSearch         = { fg = solarized.highlight, bg = solarized.white, style = 'reverse' },
        LineNr            = { fg = solarized.line_numbers, bg = solarized.bg_alt },
        CursorLineNr      = { fg = solarized.accent },
        MatchParen        = { fg = solarized.purple, bg = solarized.bg_alt, style = 'bold' },
        ModeMsg           = { fg = solarized.accent },
        MoreMsg           = { fg = solarized.accent },
        NonText           = { fg = solarized.disabled },
        Pmenu             = { fg = solarized.fg, bg = solarized.none },
        PmenuSel          = { fg = solarized.accent, bg = solarized.active },
        PmenuSbar         = { fg = solarized.text, bg = solarized.contrast },
        PmenuThumb        = { fg = solarized.fg, bg = solarized.accent },
        Question          = { fg = solarized.green },
        QuickFixLine      = { fg = solarized.highlight, bg = solarized.white, style = 'reverse' },
        qfLineNr          = { fg = solarized.highlight, bg = solarized.white, style = 'reverse' },
        Search            = { fg = solarized.highlight, bg = solarized.white, style = 'reverse' },
        SpecialKey        = { fg = solarized.yellow },
        SpellBad          = { fg = solarized.red, bg = solarized.none, style = 'italic,undercurl' },
        SpellCap          = { fg = solarized.blue, bg = solarized.none, style = 'italic,undercurl' },
        SpellLocal        = { fg = solarized.cyan, bg = solarized.none, style = 'italic,undercurl' },
        SpellRare         = { fg = solarized.yellow, bg = solarized.none, style = 'italic,undercurl' },
        StatusLine        = { fg = solarized.fg, bg = solarized.contrast },
        StatusLineNC      = { fg = solarized.text, bg = solarized.disabled },
        StatusLineTerm    = { fg = solarized.fg, bg = solarized.contrast },
        StatusLineTermNC  = { fg = solarized.text, bg = solarized.disabled },
        TabLineFill       = { fg = solarized.fg },
        TablineSel        = { fg = solarized.bg, bg = solarized.accent },
        Tabline           = { fg = solarized.fg },
        Title             = { fg = solarized.green, bg = solarized.none, style = 'bold' },
        Visual            = { fg = solarized.none, bg = solarized.selection },
        VisualNOS         = { fg = solarized.none, bg = solarized.selection },
        WarningMsg        = { fg = solarized.purple },
        WildMenu          = { fg = solarized.orange, bg = solarized.none, style = 'bold' },
        CursorColumn      = { fg = solarized.none, bg = solarized.active },
        CursorLine        = { fg = solarized.none, bg = solarized.bg_alt },
        ToolbarLine       = { fg = solarized.fg, bg = solarized.bg_alt },
        ToolbarButton     = { fg = solarized.fg, bg = solarized.none, style = 'bold' },
        NormalMode        = { fg = solarized.accent, bg = solarized.none, style = 'reverse' },
        InsertMode        = { fg = solarized.green, bg = solarized.none, style = 'reverse' },
        ReplacelMode      = { fg = solarized.red, bg = solarized.none, style = 'reverse' },
        VisualMode        = { fg = solarized.yellow, bg = solarized.none, style = 'reverse' },
        CommandMode       = { fg = solarized.gray, bg = solarized.none, style = 'reverse' },
        Warnings          = { fg = solarized.purple },

        healthError       = { fg = solarized.error },
        healthSuccess     = { fg = solarized.green },
        healthWarning     = { fg = solarized.purple },

        -- Dashboard
        DashboardShortCut = { fg = solarized.gray },
        DashboardHeader   = { fg = solarized.gray },
        DashboardCenter   = { fg = solarized.gray },
        DashboardFooter   = { fg = solarized.green, style = 'italic' },

    }

    -- Options:

    --Set transparent background
    if vim.g.solarized_disable_background == true then
        editor.Normal     = { fg = solarized.fg, bg = solarized.none } -- normal text and background color
        editor.SignColumn = { fg = solarized.fg, bg = solarized.none }
    else
        editor.Normal     = { fg = solarized.fg, bg = solarized.bg } -- normal text and background color
        editor.SignColumn = { fg = solarized.fg, bg = solarized.bg }
    end

    -- Remove window split borders
    if vim.g.solarized_borders == true then
        editor.VertSplit = { fg = solarized.border }
    else
        editor.VertSplit = { fg = solarized.bg }
    end

    return editor
end

theme.loadTerminal = function()
    vim.g.terminal_color_0 = solarized.black
    vim.g.terminal_color_1 = solarized.red
    vim.g.terminal_color_2 = solarized.green
    vim.g.terminal_color_3 = solarized.purple
    vim.g.terminal_color_4 = solarized.blue
    vim.g.terminal_color_5 = solarized.yellow
    vim.g.terminal_color_6 = solarized.cyan
    vim.g.terminal_color_7 = solarized.white
    vim.g.terminal_color_8 = solarized.gray
    vim.g.terminal_color_9 = solarized.red
    vim.g.terminal_color_10 = solarized.green
    vim.g.terminal_color_11 = solarized.purple
    vim.g.terminal_color_12 = solarized.blue
    vim.g.terminal_color_13 = solarized.yellow
    vim.g.terminal_color_14 = solarized.cyan
    vim.g.terminal_color_15 = solarized.white
end

theme.loadTreeSitter = function()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAttribute              = ts['@attribute'],
        TSBoolean                = ts['@boolean'],
        TSCharacter              = ts['@character'],
        TSConstructor            = ts['@constructor'],
        TSConstant               = ts['@constant'],
        TSConstBuiltin           = ts['@constant.builtin'],
        TSConstMacro             = ts['@constant.macro'],
        TSError                  = ts['@error'],
        TSException              = ts['@exception'],
        TSField                  = ts['@field'],
        TSFloat                  = ts['@float'],
        TSFuncMacro              = ts['@function.macro'],
        TSInclude                = ts['@include'],
        TSLabel                  = ts['@label'],
        TSNamespace              = ts['@namespace'],
        TSNumber                 = ts['@number'],
        TSOperator               = ts['@operator'],
        TSParameter              = ts['@parameter'],
        TSProperty               = ts['@property'],
        TSPunctDelimiter         = ts['@punctutation.delimiter'],
        TSPunctBracket           = ts['@punctutation.bracket'],
        TSPunctSpecial           = ts['@punctutation.special'],
        TSString                 = ts['@string'],
        TSStringRegex            = ts['@string.regex'],
        TSStringEscape           = ts['@string.escape'],
        TSSymbol                 = ts['@symbol'],
        TSType                   = ts['@type'],
        TSTypeBuiltin            = ts['@type.builtin'],
        TSTag                    = ts['@tag'],
        TSTagDelimiter           = ts['@tag.delimiter'],
        TSText                   = ts['@text'],
        TSTextReference          = ts['@text.reference'],
        TSEmphasis               = ts['@text.emphasis'],
        TSUnderline              = ts['@text.underline'],
        TSStrike                 = ts['@text.strikethrough'],
        TSTitle                  = ts['@text.title'],
        TSLiteral                = ts['@text.literal'],
        TSURI                    = ts['@text.uri'],

        ['@lsp.type.namespace']  = ts['@namespace'],
        ['@lsp.type.type']       = ts['@type'],
        ['@lsp.type.class']      = ts['@type'],
        ['@lsp.type.enum']       = ts['@type'],
        ['@lsp.type.interface']  = ts['@type'],
        ['@lsp.type.struct']     = ts['@type.definition'],
        ['@lsp.type.parameter']  = ts['@parameter'],
        ['@lsp.type.variable']   = ts['@variable'],
        ['@lsp.type.property']   = ts['@property'],
        ['@lsp.type.enumMember'] = ts['@constant'],
        ['@lsp.type.function']   = ts['@function'],
        ['@lsp.type.method']     = ts['@method'],
        ['@lsp.type.macro']      = ts['@function.macro'],
        ['@lsp.type.decorator']  = ts['@function'],
    }

    -- Options:

    -- Italic comments
    if vim.g.solarized_italic_comments == true then
        treesitter.TSComment = { fg = solarized.comments, bg = solarized.none, style = 'bold,italic' } -- For comment blocks.
    else
        treesitter.TSComment = ts['@comment'];                                                         -- For comment blocks.
    end

    if vim.g.solarized_italic_keywords == true then
        treesitter.TSConditional     = { fg = solarized.greeen, style = 'italic' }     -- For keywords related to conditionnals.
        treesitter.TSKeyword         = { fg = solarized.green, style = 'italic' }      -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat          = { fg = solarized.green, style = 'bold,italic' } -- For keywords related to loops.
        treesitter.TSKeywordFunction = { fg = solarized.green, style = 'bold,italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional     = ts['@conditional'];                             -- For keywords related to conditionnals.
        treesitter.TSKeyword         = ts['@keyword'];                                 -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat          = ts['@repeat'];                                  -- For keywords related to loops.
        treesitter.TSKeywordFunction = ts['@keyword.function'];                        -- For keywords used to define a fuction.
    end

    if vim.g.solarized_italic_functions == true then
        treesitter.TSFunction    = { fg = solarized.yellow, style = 'bold,italic' } -- For fuction (calls and definitions).
        treesitter.TSMethod      = { fg = solarized.yellow, style = 'bold,italic' } -- For method calls and definitions.
        treesitter.TSFuncBuiltin = { fg = solarized.purple, style = 'bold,italic' } -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction    = ts['@function'];                                 -- For fuction (calls and definitions).
        treesitter.TSMethod      = ts['@method'];                                   -- For method calls and definitions.
        treesitter.TSFuncBuiltin = ts['@function.builtin'];                         -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.solarized_italic_variables == true then
        treesitter.TSVariable        = { fg = solarized.gray, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin = { fg = solarized.gray, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable        = ts['@variable'];                          -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin = ts['@variable.builtin'];                  -- Variable names that are defined by the languages, like `this` or `self`.
    end

    for k, v in pairs(ts) do treesitter[k] = v end

    return treesitter
end

theme.loadLSP = function()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError           = { fg = solarized.error },                            -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError              = { fg = solarized.error },                            -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError          = { fg = solarized.error },                            -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError       = { fg = solarized.error },                            -- Virtual text "Error"
        LspDiagnosticsUnderlineError         = { style = 'undercurl', sp = solarized.error },       -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning         = { fg = solarized.purple },                           -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning            = { fg = solarized.purple },                           -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning        = { fg = solarized.purple },                           -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning     = { fg = solarized.purple },                           -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning       = { style = 'undercurl', sp = solarized.purple },      -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation     = { fg = solarized.paleblue },                         -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation        = { fg = solarized.paleblue },                         -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation    = { fg = solarized.paleblue },                         -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = { fg = solarized.paleblue },                         -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation   = { style = 'undercurl', sp = solarized.paleblue },    -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint            = { fg = solarized.yellow },                           -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint               = { fg = solarized.yellow },                           -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint           = { fg = solarized.yellow },                           -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint        = { fg = solarized.yellow },                           -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint          = { style = 'undercurl', sp = solarized.paleblue },    -- used to underline "Hint" diagnostics.
        LspReferenceText                     = { fg = solarized.accent, bg = solarized.highlight }, -- used for highlighting "text" references
        LspReferenceRead                     = { fg = solarized.accent, bg = solarized.highlight }, -- used for highlighting "read" references
        LspReferenceWrite                    = { fg = solarized.accent, bg = solarized.highlight }, -- used for highlighting "write" references
    }

    return lsp
end

theme.loadPlugins = function()
    -- Plugins highlight groups

    local plugins = {
        -- LspTrouble
        LspTroubleText              = { fg = solarized.text },
        LspTroubleCount             = { fg = solarized.yellow, bg = solarized.active },
        LspTroubleNormal            = { fg = solarized.fg, bg = solarized.sidebar },

        -- Diff
        diffAdded                   = { fg = solarized.green },
        diffRemoved                 = { fg = solarized.red },
        diffChanged                 = { fg = solarized.purple },
        diffOldFile                 = { fg = solarized.yelow },
        diffNewFile                 = { fg = solarized.orange },
        diffFile                    = { fg = solarized.blue },
        diffLine                    = { fg = solarized.comments },
        diffIndexLine               = { fg = solarized.yellow },

        -- Neogit
        NeogitBranch                = { fg = solarized.paleblue },
        NeogitRemote                = { fg = solarized.yellow },
        NeogitHunkHeader            = { fg = solarized.fg, bg = solarized.highlight },
        NeogitHunkHeaderHighlight   = { fg = solarized.blue, bg = solarized.contrast },
        NeogitDiffContextHighlight  = { fg = solarized.text, bg = solarized.contrast },
        NeogitDiffDeleteHighlight   = { fg = solarized.red },
        NeogitDiffAddHighlight      = { fg = solarized.green },

        -- GitGutter
        GitGutterAdd                = { fg = solarized.green },  -- diff mode: Added line |diff.txt|
        GitGutterChange             = { fg = solarized.purple }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete             = { fg = solarized.red },    -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd                 = { fg = solarized.green },  -- diff mode: Added line |diff.txt|
        GitSignsAddNr               = { fg = solarized.green },  -- diff mode: Added line |diff.txt|
        GitSignsAddLn               = { fg = solarized.green },  -- diff mode: Added line |diff.txt|
        GitSignsChange              = { fg = solarized.purple }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr            = { fg = solarized.purple }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn            = { fg = solarized.purple }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete              = { fg = solarized.red },    -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr            = { fg = solarized.red },    -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn            = { fg = solarized.red },    -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopePromptBorder       = { fg = solarized.cyan },
        TelescopeResultsBorder      = { fg = solarized.yellow },
        TelescopePreviewBorder      = { fg = solarized.green },
        TelescopeSelectionCaret     = { fg = solarized.yellow },
        TelescopeSelection          = { fg = solarized.yellow },
        TelescopeMatching           = { fg = solarized.cyan },
        TelescopeNormal             = { fg = solarized.fg, bg = solarized.float },

        -- NvimTree
        NvimTreeRootFolder          = { fg = solarized.blue, style = 'bold' },
        NvimTreeGitDirty            = { fg = solarized.purple },
        NvimTreeGitNew              = { fg = solarized.green },
        NvimTreeImageFile           = { fg = solarized.purple },
        NvimTreeExecFile            = { fg = solarized.green },
        NvimTreeSpecialFile         = { fg = solarized.yellow, style = 'underline' },
        NvimTreeFolderName          = { fg = solarized.paleblue },
        NvimTreeEmptyFolderName     = { fg = solarized.disabled },
        NvimTreeFolderIcon          = { fg = solarized.accent },
        NvimTreeIndentMarker        = { fg = solarized.disabled },
        LspDiagnosticsError         = { fg = solarized.error },
        LspDiagnosticsWarning       = { fg = solarized.purple },
        LspDiagnosticsInformation   = { fg = solarized.paleblue },
        LspDiagnosticsHint          = { fg = solarized.yellow },

        -- WhichKey
        WhichKey                    = { fg = solarized.accent, style = 'bold' },
        WhichKeyGroup               = { fg = solarized.text },
        WhichKeyDesc                = { fg = solarized.blue, style = 'italic' },
        WhichKeySeperator           = { fg = solarized.fg },
        WhichKeyFloating            = { bg = solarized.float },
        WhichKeyFloat               = { bg = solarized.float },

        -- LspSaga
        DiagnosticError             = { fg = solarized.error },
        DiagnosticWarning           = { fg = solarized.purple },
        DiagnosticInformation       = { fg = solarized.paleblue },
        DiagnosticHint              = { fg = solarized.yellow },
        DiagnosticTruncateLine      = { fg = solarized.fg },
        LspFloatWinNormal           = { bg = solarized.contrast },
        LspFloatWinBorder           = { fg = solarized.yellow },
        LspSagaBorderTitle          = { fg = solarized.cyan },
        LspSagaHoverBorder          = { fg = solarized.paleblue },
        LspSagaRenameBorder         = { fg = solarized.green },
        LspSagaDefPreviewBorder     = { fg = solarized.green },
        LspSagaCodeActionBorder     = { fg = solarized.blue },
        LspSagaFinderSelection      = { fg = solarized.green },
        LspSagaCodeActionTitle      = { fg = solarized.paleblue },
        LspSagaCodeActionContent    = { fg = solarized.yellow },
        LspSagaSignatureHelpBorder  = { fg = solarized.gray },
        ReferencesCount             = { fg = solarized.yellow },
        DefinitionCount             = { fg = solarized.yellow },
        DefinitionIcon              = { fg = solarized.blue },
        ReferencesIcon              = { fg = solarized.blue },
        TargetWord                  = { fg = solarized.cyan },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = solarized.accent },
        BufferLineFill              = { bg = solarized.bg_alt },

        -- Sneak
        Sneak                       = { fg = solarized.bg, bg = solarized.accent },
        SneakScope                  = { bg = solarized.selection },

        -- Indent Blankline
        IndentBlanklineChar         = { fg = solarized.highlight },
        IndentBlanklineContextChar  = { fg = solarized.disabled },

        -- Nvim dap
        DapBreakpoint               = { fg = solarized.red },
        DapStopped                  = { fg = solarized.green },
    }

    -- Options:

    -- Disable nvim-tree background
    if vim.g.solarized_disable_background == true then
        plugins.NvimTreeNormal = { fg = solarized.fg, bg = solarized.none }
    else
        plugins.NvimTreeNormal = { fg = solarized.fg, bg = solarized.sidebar }
    end

    return plugins
end

return theme
