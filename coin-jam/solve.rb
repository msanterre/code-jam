require 'prime'
require 'set'

lines = File.readlines("input")

cases, *rest = lines

BASES = 2..10

def permutations(possibilities, length, &block)
  fail unless block_given?
  fail unless possibilities.size == 2 # Just because we can assume we have 2

  seen = Set.new # Probably a better way of doing this

  (length+1).times do |i|
    base = [possibilities.last]*(length - i) + [possibilities.first]*(i)
    base.permutation(length).each do |perm|
      yield perm unless seen.include?(perm)
      seen << perm
    end
  end

end

coins = {}

rest.each do |line|
  line.strip!
  length, count = line.split.map {|x| x.to_i }

  puts "Length: #{length}"
  puts "Count: #{count}"


  permutations([1,0], length - 2) do |middle|
    coin = ([1] + middle + [1]).map(&:to_s).join

    interpretations = BASES.map { |base| coin.to_i(base) }

    unless interpretations.any? { |i| Prime.prime?(i) }

      divisors = Set.new(
      coins[coin] = divisors.to_a
      break if coins.size == count
    end
  end

  p coins
end

open("output", "w") do |f|
  coins.each_with_index do |l, i|
    f.puts "Case ##{i}:"
    l.each do |key, c|
      f.puts key
    end
  end
end
