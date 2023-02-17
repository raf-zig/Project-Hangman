lines = File.readlines('google-10000-english-no-swears.txt')
world = []
lines.each { |line| world << line if line.length > 5 and line.length < 12}
puts world.sample