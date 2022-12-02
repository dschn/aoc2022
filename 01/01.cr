elves_input = File.read_lines("input")
elves_calories = [] of Int64

elves_input.chunk { |x| x == "" }.reject { |bool,_| bool == true }.each do |bool, calories|
  elves_calories << calories.map { |value| value.to_i }.sum
end

puts elves_calories.max
puts elves_calories.sort.last(3).sum