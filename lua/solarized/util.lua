local util = {}
local solarized = require('solarized.theme')

-- Go trough the table and highlight the group with the color values
util.highlight = function (group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""

    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

    vim.cmd(hl)
    if color.link then vim.cmd("highlight! link " .. group .. " " .. color.link) end
end

-- Only define Solarized if it's the active colorshceme
function util.onColorScheme()
  if vim.g.colors_name ~= "solarized" then
    vim.cmd [[autocmd! Solarized]]
    vim.cmd [[augroup! Solarized]]
  end
end

-- Change the background for the terminal, packer and qf windows
util.contrast = function ()
    vim.cmd [[augroup Solarized]]
    vim.cmd [[  autocmd!]]
    vim.cmd [[  autocmd ColorScheme * lua require("solarized.util").onColorScheme()]]
    vim.cmd [[  autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType packer setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[  autocmd FileType qf setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]]
    vim.cmd [[augroup end]]
end

-- Load the theme
function util.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    if not vim.o.background then
        vim.o.background = "light"
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "solarized"

    -- Load plugins, treesitter and lsp async
    local async
    async = vim.loop.new_async(vim.schedule_wrap(function ()
        solarized.loadTerminal()

        -- imort tables for plugins, treesitter and lsp
        tables = {
            plugins = solarized.loadPlugins(),
            treesitter = solarized.loadTreeSitter(),
            lsp = solarized.loadLSP(),
        }
        for _, table in pairs(tables) do
            util.highlight_table_members(table)
        end

        -- if contrast is enabled, apply it to sidebars and floating windows
        if vim.g.solarized_contrast == true then
            util.contrast()
        end
        async:close()

    end))

    -- load the most importaint parts of the theme
    local editor = solarized.loadEditor()
    local syntax = solarized.loadSyntax()

    -- imort tables for plugins, treesitter and lsp
    tables = {
        editor = solarized.loadEditor(),
        syntax = solarized.loadSyntax(),
    }
    for _, table in pairs(tables) do
        util.highlight_table_members(table)
    end

    -- load the rest later ( lsp, treesitter, plugins )
    async:send()
end

function util.highlight_table_members(table)
    -- loop trough the table and highlight every member
    for group, colors in pairs(table) do
        util.highlight(group, colors)
    end
end

return util
