-- constants.lua

-- Game Settings

GAME = {
  width = 640,
  height = 480,
  launch_speed = 350,
  paddle_speed = 450,
  sensitivity = 0.5
}

-- Grid Layout

GRID = {
  cols = 16,
  rows = 4,
  lives_cols = 8,
  top_empty_rows = 2
}

-- Auto-calculate bricks sizes

GRID.brick_width = GAME.width / GRID.cols
GRID.brick_height = GRID.brick_width / 2
GRID.life_width = GRID.brick_width * 2

-- Vertical offsets

GRID.start_y = GRID.brick_height * GRID.top_empty_rows
GRID.bottom_y = GAME.height - GRID.brick_height

-- Paddle Geometry 

PADDLE = {
  width = GRID.brick_width * 2,
  height = GRID.brick_height,
  y = GAME.height - (GRID.brick_height * 3)
}

BALL = { radius = 6 }
