-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================

local colors = {
  grey   = "#7f8490",
  bg_green  = "#a7df78",
  bg0   = "#2c2e34",
  bg4   = "#414550",
  bg1   = "#33353f",
  bg_blue   = "#85d3f2",
  orange   = "#f39660",
  purple   = "#b39df3",
  yellow   = "#e7c664",
  bg_red   = "#ff6077",
  fg   = "#e2e2e3",
}

local sonokai = {
  normal = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.bg_red, gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  command = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.yellow , gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  replace = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.orange , gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  inactive = {
    b = { fg = colors.grey, bg = colors.bg1 },
    a = { fg = colors.grey, bg = colors.bg1 , gui = "bold", },
    c = { fg = colors.grey, bg = colors.bg1 },
  },
  terminal = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.bg_red , gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  visual = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.purple , gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  insert = {
    b = { fg = colors.fg, bg = colors.bg4 },
    a = { fg = colors.bg0, bg = colors.bg_green , gui = "bold", },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
}

return sonokai
