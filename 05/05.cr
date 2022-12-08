crates = [
	%w[],
	%w[R S L F Q],
	%w[N Z Q G P T],
	%w[S M Q B],
	%w[T G Z J H C B Q],
	%w[P H M B N F S],
	%w[P C Q N S L V G],
	%w[W C F],
	%w[Q H G Z W V P M],
	%w[G Z D L C N R]
]

puts crates.join("\n")

input_lines = File.read_lines("input")
input_lines.each do |input|
	_, num_crates, _, from_crate, _, to_crate = input.split(" ")

	num_crates = num_crates.to_i
	from_crate = from_crate.to_i
	to_crate = to_crate.to_i

	move_crates = crates[from_crate].pop(num_crates)
	crates[to_crate] += move_crates #.reverse
end

puts crates.join("\n")
puts crates.map { |c| c.last if c.size > 0}.join
