input_lines = File.read_lines("input")
current_directory = [] of String
listing_files = false
nodes = {} of String => Int32

input_lines.each do |input|
  tokens = input.split(" ")
  listing_files = false if tokens[0] == "$"

  if listing_files
    case tokens[0]
    when "dir"
      # noop
    else
      nodes[current_directory.join("/")] ||= 0
      nodes[current_directory.join("/")] += tokens[0].to_i

      walk_parents = current_directory.dup

      while walk_parents.any?
        walk_parents.pop

        next if walk_parents.empty?

        nodes[walk_parents.join("/")] ||= 0
        nodes[walk_parents.join("/")] += tokens[0].to_i
      end
    end
  end

  if tokens[0] == "$"
    command = tokens[1]
    case command
    when "cd"
      directory = tokens[2]
      if directory == ".."
        current_directory.pop
      else      
        current_directory.push(directory)
      end
    when "ls"
      listing_files = true
      next
    end
  end
end

# part 1
puts nodes.sum { |n| n[1] <= 100_000 ? n[1] : 0 }

# part 2
available_space = 70000000
update_space = 30000000
used_space = nodes["/"]
free_space = available_space - used_space
need_space = update_space - free_space

puts nodes.select { |k, v| v >= need_space }.values.min