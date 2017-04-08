def invert(chr)
  return chr == '+' ? '-' : '+'
end

def flip(arr, idx, size)
  raise "Size under 0" if size < 0
  raise "Index below 0" if idx < 0
  raise "idx #{idx}, size: #{size}, length: #{arr.length}" if idx + size > arr.length

  for i in 0...size
    adj = i+idx
    arr[adj] = invert(arr[adj])
  end

  return arr
end

def gucci(arr)
  arr.all? {|x| x == "+"}
end

def solve
  lines = File.readlines("A-large.in")

  cases, *rest = lines

  results = rest.map do |line|
    line = line.chomp
    s, k = line.split(" ")
    k = k.to_i
    arr = s.chars

    tries = 0

    for i in (0..arr.length - k)
      chr = arr[i]
      if chr == '-'
        tries += 1
        arr = flip(arr, i, k)
      end
    end

    if gucci(arr)
      tries.to_s
    else
      "IMPOSSIBLE"
    end
  end

  open("output", "w") do |f|
    results.each_with_index do |l, i|
      f.puts "Case ##{i+1}: #{l}"
    end
  end

end

p solve
