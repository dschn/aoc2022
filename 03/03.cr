input_lines = File.read_lines("input")

total = 0

def priority(input)
  offset = input =~ /[a-z]/ ? 96 : 38
  input.byte_at(0) - offset
end

input_lines.each do |input|
  input_middle = (input.size / 2).to_i
  input_a = input[0, input_middle].split("")
  input_b = input[input_middle, input.size].split("")
  common = (input_a & input_b).join

  total += priority(common)
end

puts total

total = 0

input_lines.each_slice(3).each do |chunk|
  common = chunk.map { |c| c.split("") }.reduce { |acc, c| acc & c }.join
  total += priority(common)
end

puts total