lines = File.readlines("input-large")

cases, *rest = lines

def flip(char)
  char == "+" ? "-" : "+"
end

results = rest.map do |line|
  line.strip!

  i = 0
  until line.chars.all? { |c| c == "+" } do
    first = line.chars.first
    index = line.index(flip(first))

    if index.nil?
      i+=1
      break
    end

    parts = [line[0..(index-1)], line[index..-1]]

    line = parts[0].chars.map {|x| flip(x)}.join + parts[1]
    i+=1
  end

  puts i
  i
end

open("output", "w") do |f|
  results.each_with_index do |l, i|
    f.puts "Case ##{i+1}: #{l}"
  end
end
