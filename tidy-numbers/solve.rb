def tidy(num)
  last_digit = 0
  idx = num.to_s.chars.find_index do |chr|
    digit = chr.to_i

    if !(digit >= last_digit)
      a = true
    else
      a = false
    end
    last_digit = digit
    a
  end

  unless idx.nil?
    sub = num.to_s[idx..-1]
    return num - (sub.to_i + 1)
  else
    return num
  end
end

def tidy?(num)
  last_digit = 0

  idx = num.to_s.chars.find_index do |chr|
    digit = chr.to_i

    if !(digit >= last_digit)
      a = true
    else
      a = false
    end
    last_digit = digit
    a
  end

  return idx.nil?
end

def solve
  lines = File.readlines("B-large.in")

  cases, *rest = lines

  results = rest.map do |line|
    line = line.chomp
    num = line.to_i

    a = tidy(num)
    while !tidy?(a)
      a = tidy(a)
    end
    a
  end

  open("output", "w") do |f|
    results.each_with_index do |l, i|
      f.puts "Case ##{i+1}: #{l}"
    end
  end

end

p solve
