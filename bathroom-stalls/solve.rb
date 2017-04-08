def split(num)
  div = num/2
  num.odd? ? [div, div] : [div, div - 1]
end

# blocks is inversely sorted array of N free seats
# returns new inversely sorted array of N free seats
def seat(blocks)
  block = blocks.shift
  spl = split(block)
  blocks += spl
  return [spl, blocks.sort.reverse]
end

def solve
  lines = File.readlines("small-2")

  cases, *rest = lines

  results = rest.map do |line|
    n, k = line.chomp.split(" ").map(&:to_i)
    block = [n]
    spl = nil

    k.times do
      spl, block = seat(block)
    end

    puts "3"
    spl
  end

  open("output", "w") do |f|
    results.each_with_index do |l, i|
      f.puts "Case ##{i+1}: #{l[0]} #{l[1]}"
    end
  end

end

p solve
