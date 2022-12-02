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

score = input.sum do |game|
  opponent = game[0]
  desired_outcome = game[1]
  outcomes = outcome_scores.keys.select { |k| k[0].to_s == opponent }

  match = ""
  match = case desired_outcome
  when "X" # need loss
    outcomes.find { |outcome| outcome_scores[outcome] == 0 }
  when "Y" # need draw
    outcomes.find { |outcome| outcome_scores[outcome] == 3 }
  when "Z" # need win
    outcomes.find { |outcome| outcome_scores[outcome] == 6 }
  end.as(String)

  outcome_scores[match] + scores[match[1].to_s]
end

puts score
