input_lines = File.read_lines("input")

fully_contains = 0
partially_contains = 0

input_lines.each do |line|
  range1, range2 = line.split(",")
  range1_a, range1_b = range1.split("-").map { |r| r.to_i }
  range2_a, range2_b = range2.split("-").map { |r| r.to_i }
  range_a = (range1_a..range1_b).to_a
  range_b = (range2_a..range2_b).to_a

  common = (range_a & range_b)

  if common == range_a || common == range_b 
    fully_contains += 1
  end

  if common.size > 0
    partially_contains += 1
  end
end

puts fully_contains
puts partially_contains