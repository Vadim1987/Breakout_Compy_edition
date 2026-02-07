-- constants.lua

-- Game Settings

GAME = {
  width = 640,
  height = 480,
  launch_spd = 350,
  pad_spd = 450,
  sensitivity = 0.5
}

-- Grid Layout

GRID = {
  cols = 16,
  rows = 4,
  lives_cols = 8,
  top_empty = 2,
  pad_empty = 1
}

-- Auto-calculate sizes

GRID.cw = GAME.width / GRID.cols
GRID.ch = GRID.cw / 2
GRID.life_w = GRID.cw * 2

-- Vertical offsets

GRID.start_y = GRID.ch * GRID.top_empty
GRID.bot_y = GAME.height - GRID.ch

-- Paddle Geometry 

PADDLE = {
  w = GRID.cw * 2,
  h = GRID.ch,
  y = GAME.height - (GRID.ch * 3)
}

BALL = { radius = 6 }
