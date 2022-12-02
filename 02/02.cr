input = File.read_lines("input").map { |line| line.split(" ") }

scores = {
  "X" => 1, # rock
  "Y" => 2, # paper
  "Z" => 3  # scissors
}

outcome_scores = {
  "AX" => 3,
  "AY" => 6,
  "AZ" => 0,
  "BX" => 0,
  "BY" => 3,
  "BZ" => 6,
  "CX" => 6,
  "CY" => 0,
  "CZ" => 3
}

puts input.sum { |game| outcome_scores[game.join] + scores[game[1]] }