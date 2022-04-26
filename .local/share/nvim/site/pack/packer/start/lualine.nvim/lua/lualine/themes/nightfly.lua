-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
    color3   = '#02020E',
    color6   = '#a1aab8',
    color7   = '#5563C4',
    color8   = '#ae81ff',
    color9   = '#DD82A2',
    color0   = '#092236',
    color10  = '#0f0f19',
    color1   = '#ff5874',
    color2   = '#c3ccdc',
}

return {
  replace = {
    a = { fg = colors.color0, bg = colors.color1, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  inactive = {
    a = { fg = colors.color3, bg = colors.color8, gui = 'bold' },
    b = { fg = colors.color3, bg = colors.color8, gui = 'bold' },
    c = { fg = colors.color2, bg = '#2d2d2d', gui = 'bold' },
  },
  normal = {
    a = { fg = colors.color3, bg = colors.color7, gui = 'bold' },
    b = { fg = colors.color2, bg = '#2d2d2d', gui = 'bold' },
    c = { fg = colors.color2, bg = colors.color3, gui = 'bold' },
  },
  visual = {
    a = { fg = colors.color0, bg = colors.color8, gui = 'bold' },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  insert = {
    a = { fg = colors.color3, bg = colors.color9, gui = 'bold' },
    b = { fg = colors.color2, bg = '#2d2d2d', gui = 'bold' },
    c = { fg = colors.color2, bg = colors.color3, gui = 'bold' },
  },
}
