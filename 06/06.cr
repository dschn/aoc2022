input_string = File.read_lines("input").first.split("")

def find_signal(signal, size)
  signal.each.with_index do |char, index|
    if signal[index..index+(size-1)].uniq.size == size
      return index + size
    end
  end
end

puts find_signal(input_string, 4)
puts find_signal(input_string, 14)
