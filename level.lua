-- Level.lua

level = { }

function make_brick(x, y, w, color)
  return {
    pos = {
      x = x,
      y = y
    },
    size = {
      x = w,
      y = GRID.ch
    },
    vel = zero2d(),
    color = color,
    destruct = true
  }
end

function add_row(list, r, col_main, col_dim)
  local y = GRID.start_y + (r - 1) * GRID.ch
  for c = 1, GRID.cols do
    local color = ((c + r) % 2 == 0) and col_main or col_dim
    local x = (c - 1) * GRID.cw
    table.insert(list, make_brick(x, y, GRID.cw, color))
  end
end

function gen_grid(list)
  add_row(list, 1, COLOR_R, COLOR_R_DIM)
  add_row(list, 2, COLOR_Y, COLOR_Y_DIM)
  add_row(list, 3, COLOR_G, COLOR_G_DIM)
  add_row(list, 4, COLOR_B, COLOR_B_DIM)
end

function gen_lives(list)
  local y = GRID.bot_y
  for c = 1, GRID.lives_cols do
    local color = (c % 2 == 0) and COLOR_M_DIM or COLOR_M
    local x = (c - 1) * GRID.life_w
    table.insert(list, make_brick(x, y, GRID.life_w, color))
  end
end

function level.generate()
  local list = { }
  gen_grid(list)
  gen_lives(list)
  return list
end
