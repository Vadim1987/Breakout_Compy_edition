-- Level.lua

level = { }

function make_brick(x, y, color, is_target)
  return {
    pos = {
      x = x,
      y = y
    },
    size = {
      x = (is_target and GRID.brick_width or GRID.life_width),
      y = GRID.brick_height
    },
    vel = zero2d(),
    color = color,
    destruct = true,
    is_target = is_target
  }
end

function add_row(list, row, base_col)
  local y = GRID.start_y + (row - 1) * GRID.brick_height
  for c = 1, GRID.cols do
    local c_index = base_col + Color.bright * ((c + row) % 2)
    local x = (c - 1) * GRID.brick_width
    local b = make_brick(x, y, Color[c_index], true)
    table.insert(list, b)
  end
end

function target_bricks(list)
  add_row(list, 1, Color.red)
  add_row(list, 2, Color.yellow)
  add_row(list, 3, Color.green)
  add_row(list, 4, Color.blue)
end

function lives_bricks(list)
  local y = GRID.bottom_y
  for c = 1, GRID.lives_cols do
    local c_index = Color.magenta + Color.bright * (c % 2)
    local x = (c - 1) * GRID.life_width
    table.insert(list, make_brick(x, y, Color[c_index], false))
  end
end

function level.generate()
  local list = { }
  target_bricks(list)
  lives_bricks(list)
  list.target = GRID.cols * GRID.rows
  return list
end
