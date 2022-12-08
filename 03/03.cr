input_lines = File.read_lines("input")

total = 0

input_lines.each do |input|
  input_middle = (input.size / 2).to_i
  input_a = input[0, input_middle].split("")
  input_b = input[input_middle, input.size].split("")
  common = (input_a & input_b).join
  offset = common =~ /[a-z]/ ? 96 : 38
  priority = common.byte_at(0) - offset

  total += priority
end

puts total
