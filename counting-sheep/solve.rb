require 'set'

lines = File.readlines("input-large")

cases, *rest = lines

results = rest.map do |line|
  line.strip!

  if line == "0"
    "INSOMNIA"
  else
    digits = Set.new
    start = line.to_i
    i = 1

    until digits.size == 10
      digits += (i*start).to_s.chars
      i += 1
    end

    (i-1)*start
  end

end

p results

open("output", "w") do |f|
  results.each_with_index do |l, i|
    f.puts "Case ##{i+1}: #{l}"
  end
end
