local wezterm = require('wezterm')
local config = {}
local act = wezterm.action

keys = {

    {
        key = '1',
        mods = 'SUPER',
        action = act.SendString('\x00\x31'),
    },
    {
        key = '2',
        mods = 'SUPER',
        action = act.SendString('\x00\x32'),
    },
    {
        key = '3',
        mods = 'SUPER',
        action = act.SendString('\x00\x33'),
    },
    {
        key = '4',
        mods = 'SUPER',
        action = act.SendString('\x00\x34'),
    },
    {
        key = '5',
        mods = 'SUPER',
        action = act.SendString('\x00\x35'),
    },
    {
        key = 'd',
        mods = 'SUPER',
        action = act.SendString('\x00\x76'),
    },
    {
        key = 'd',
        mods = 'SUPER|SHIFT',
        action = act.SendString('\x00\x68'),
    },
    {
        key = 't',
        mods = 'SUPER',
        action = act.SendString('\x00\x63'),
    },
    {
        key = 'w',
        mods = 'SUPER',
        action = act.SendString('\x00\x64'),
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|ALT',
        action = act.SendString('\x00\x4C'),
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|ALT',
        action = act.SendString('\x00\x52'),
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|ALT',
        action = act.SendString('\x00\x59'),
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|ALT',
        action = act.SendString('\x00\x44'),
    },
}
return config
