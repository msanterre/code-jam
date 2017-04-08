puts "Need file arg" && exit unless ARGV.size == 1

lines = File.readlines(ARGV[0]).map(&:chomp)

cases, *data = lines[0].to_i, lines[..-1]
