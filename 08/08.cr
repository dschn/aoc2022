input_lines = File.read_lines("input")

grid = [] of Array(Int32)

input_lines.each.with_index do |line, index|
  grid << line.split("").map { |e| e.to_i }
end

module G
  class_property grid
  @@grid = [] of Array(Int32)
end

G.grid = grid

grid_width = G.grid.size 
grid_height = G.grid.size
total_visible = 0
total_scores = [] of Int32

def visible_x?(range, x, y)
  score = 0
  tree = G.grid[y][x]

  range.each do |walk_x|
    score += 1
    return [false, score] if G.grid[y][walk_x] >= tree
  end

  [true, score]
end

def visible_y?(range, x, y)
  score = 0
  tree = G.grid[y][x]

  range.each do |walk_y| 
    score += 1
    return [false, score] if G.grid[walk_y][x] >= tree
  end

  [true, score]
end

grid_width.times do |x|
  grid_height.times do |y|

    border = y == 0 || y == grid_height-1 || x == 0 || x == grid_width-1
    current_tree = G.grid[x][y]

    if border
      total_visible += 1
    else
      cross_visibility = [
        visible_x?((0..x-1).to_a.reverse, x, y),
        visible_x?((x+1..grid_width-1).to_a, x, y),
        visible_y?((0..y-1).to_a.reverse, x, y),
        visible_y?((y+1..grid_height-1).to_a, x, y)
      ]

      visibility, scores = cross_visibility.transpose

      total_visible += 1 if visibility.any? { |v| v == true }
      
      if scores.any?
        score = scores.map { |s| s.as(Int32) }.reduce { |acc, s| acc*s }
        total_scores << score
      end
    end
  end
end

# part 1
puts total_visible

# part 2
puts total_scores.max

