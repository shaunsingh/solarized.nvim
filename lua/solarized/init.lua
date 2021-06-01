--                            M O O N L I G H T
--      _..._         _..._         _..._         _..._         _..._
--    .:::::::.     .::::. `.     .::::  `.     .::'   `.     .'     `.
--   :::::::::::   :::::::.  :   ::::::    :   :::       :   :         :
--   :::::::::::   ::::::::  :   ::::::    :   :::       :   :         :
--   `:::::::::'   `::::::' .'   `:::::   .'   `::.     .'   `.       .'
--     `':::''       `'::'-'       `'::.-'       `':..-'       `-...-'

-- Colorscheme name:    solarized.nvim
-- Description:         Port of VSCode's Solarized colorscheme for NeoVim
-- Author:              https://github.com/shaunsingh

local util = require('solarized.util')

-- Load the theme
local set = function ()
    util.load()
end

return { set = set }
