local solarized = require('solarized.colors')

local syntax = {
    -- Properties source: https://github.com/nvim-treesitter/nvim-treesitter/blob/9fa6806b88905d52b5ca36094909630919b432cc/CONTRIBUTING.md

    -- Misc
    ['@comment']               = { fg = solarized.comments },                  -- line and block comments
    ['@comment.documentation'] = { fg = solarized.comments },                  -- comments documenting code
    ['@error']                 = { fg = solarized.error, style = 'bold' },     -- syntax/parser errors
    ['@none']                  = { fg = solarized.none, bg = solarized.none }, -- completely disable the highlight
    ['@preproc']               = { fg = solarized.yellow },                    -- various preprocessor directives & shebangs
    ['@define']                = { fg = solarized.gray },                      -- preprocessor definition directives
    ['@operator']              = { fg = solarized.cyan },                      -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ['@punctuation.delimiter'] = { fg = solarized.black }, -- delimiters (e.g. `= {}, --` / `.` / `,`)
    ['@punctuation.bracket']   = { fg = solarized.black }, -- brackets (e.g. `()` / `{},` / `[]`)
    ['@punctuation.special']   = { fg = solarized.black }, -- special symbols (e.g. `{},` in string interpolation)

    -- Literals
    ['@string']                = { fg = solarized.green },                   -- string literals
    ['@string.documentation']  = { fg = solarized.green, style = 'italic' }, -- string documenting code (e.g. Python docstrings)
    ['@string.regex']          = { fg = solarized.green, style = 'bold' },   -- regular expressions
    ['@string.escape']         = { fg = solarized.disabled },                -- escape sequences
    ['@string.special']        = { fg = solarized.green },                   -- other special strings (e.g. dates)

    ['@character']             = { fg = solarized.orange },                  -- character literals
    ['@character.special']     = { fg = solarized.orange, style = 'bold' },  -- special characters (e.g. wildcards)

    ['@boolean']               = { fg = solarized.orange },                  -- boolean literals
    ['@number']                = { fg = solarized.orange },                  -- numeric literals
    ['@float']                 = { fg = solarized.orange },                  -- floating-point number literals

    -- Functions
    ['@function']              = { fg = solarized.yellow, style = 'bold' },   -- function definitions
    ['@function.builtin']      = { fg = solarized.yellow, style = 'italic' }, -- built-in functions
    ['@function.call']         = { fg = solarized.yellow },                   -- function calls
    ['@function.macro']        = { fg = solarized.blue },                     -- preprocessor macros

    ['@method']                = { fg = solarized.yellow, style = 'bold' },   -- method definitions
    ['@method.call']           = { fg = solarized.yellow },                   -- method calls

    ['@constructor']           = { fg = solarized.yellow },                   -- constructor calls and definitions
    ['@parameter']             = { fg = solarized.blue },                     -- parameters of a function

    -- Keywords
    ['@keyword']               = { fg = solarized.green },                  -- various keywords
    ['@keyword.coroutine']     = { fg = solarized.green },                  -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ['@keyword.function']      = { fg = solarized.yellow, style = 'bold' }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ['@keyword.operator']      = { fg = solarized.cyan },                   -- operators that are English words (e.g. `and` / `or`)
    ['@keyword.return']        = { fg = solarized.green },                  -- keywords like `return` and `yield`

    ['@conditional']           = { fg = solarized.cyan },                   -- keywords related to conditionals (e.g. `if` / `else`)
    ['@conditional.ternary']   = { fg = solarized.cyan },                   -- ternary operator (e.g. `?` / `:`)

    ['@repeat']                = { fg = solarized.cyan },                   -- keywords related to loops (e.g. `for` / `while`)
    ['@debug']                 = { fg = solarized.red },                    -- keywords related to debugging
    ['@label']                 = { fg = solarized.yellow },                 -- GOTO and other labels (e.g. `label:` in C)
    ['@include']               = { fg = solarized.cyan, style = 'bold' },   -- keywords for including modules (e.g. `import` / `from` in Python)
    ['@exception']             = { fg = solarized.purple, style = 'bold' }, -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Types
    ['@type']                  = { fg = solarized.yellow, style = 'bold' },   -- type or class definitions and annotations
    ['@type.builtin']          = { fg = solarized.yellow, style = 'italic' }, -- built-in types
    ['@type.definition']       = { fg = solarized.yellow },                   -- type definitions (e.g. `typedef` in C)
    ['@type.qualifier']        = { fg = solarized.yellow },                   -- type qualifiers (e.g. `const`)

    ['@storageclass']          = { fg = solarized.cyan },                     -- modifiers that affect storage in memory or life-time
    ['@attribute']             = { fg = solarized.purple },                   -- attribute annotations (e.g. Python decorators)
    ['@field']                 = { fg = solarized.gray },                     -- object and struct fields
    ['@property']              = { fg = solarized.gray },                     -- similar to `@field`

    -- Identifiers
    ['@variable']              = { fg = solarized.gray },                     -- various variable names
    ['@variable.builtin']      = { fg = solarized.purple, style = 'italic' }, -- built-in variable names (e.g. `this`)

    ['@constant']              = { fg = solarized.purple },                   -- constant identifiers
    ['@constant.builtin']      = { fg = solarized.purple, style = 'italic' }, -- built-in constant values
    ['@constant.macro']        = { fg = solarized.blue },                     -- constants defined by the preprocessor

    ['@namespace']             = { fg = solarized.purple },                   -- modules or namespaces
    ['@symbol']                = { fg = solarized.purple },                   -- symbols or atoms

    -- Text
    -- Mainly for markup languages.
    ['@text']                  = { fg = solarized.text },                          -- non-structured text
    ['@text.strong']           = { fg = solarized.text, style = 'bold' },          -- bold text
    ['@text.emphasis']         = { fg = solarized.text, style = 'italic' },        -- text with emphasis
    ['@text.underline']        = { fg = solarized.text, style = 'underline' },     -- underlined text
    ['@text.strike']           = { fg = solarized.text, style = 'strikethrough' }, -- strikethrough text
    ['@text.title']            = { fg = solarized.paleblue, style = 'bold' },      -- text that is part of a title
    ['@text.quote']            = { fg = solarized.text, style = 'italic' },        -- text quotations
    ['@text.uri']              = { fg = solarized.link },                          -- URIs (e.g. hyperlinks)
    ['@text.math']             = { fg = solarized.text },                          -- math environments (e.g. `$ ... $` in LaTeX)
    ['@text.environment']      = { fg = solarized.text },                          -- text environments of markup languages
    ['@text.environment.name'] = { fg = solarized.text },                          -- text indicating the type of an environment
    ['@text.reference']        = { fg = solarized.purple },                        -- text references, footnotes, citations, etc.

    ['@text.literal']          = { fg = solarized.fg },                            -- literal or verbatim text (e.g., inline code)
    ['@text.literal.block']    = { fg = solarized.fg },                            -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    ['@text.todo']             = { fg = solarized.purple, style = 'bold' },        -- todo notes
    ['@text.note']             = { fg = solarized.text },                          -- info notes
    ['@text.warning']          = { fg = solarized.purple },                        -- warning notes
    ['@text.danger']           = { fg = solarized.red, style = 'bold' },           -- danger/error notes

    ['@text.diff.add']         = { fg = solarized.green },                         -- added text (for diff files)
    ['@text.diff.delete']      = { fg = solarized.red },                           -- deleted text (for diff files)

    -- Tags
    -- Used for XML-like tags.
    ['@tag']                   = { fg = solarized.yellow, style = 'bold' }, -- XML tag names
    ['@tag.attribute']         = { fg = solarized.green },                  -- XML tag attributes
    ['@tag.delimiter']         = { fg = solarized.yellow },                 -- XML tag delimiters

    -- Conceal
    ['@conceal']               = { fg = solarized.disabled }, -- for captures that are only used for concealing, `@conceal` must be followed by `(#set! conceal "")`.

    -- Spell
    ['@spell']                 = {}, -- for defining regions to be spellchecked
    ['@nospell']               = {}, -- for defining regions that should NOT be spellchecked
}

return syntax
