def count_the_trees
  counter = 0
  coord_x = 3

  File.readlines('./3_12_2020.txt').drop(1).each do |line|
    path = line.strip
    idx = coord_x % path.length
    counter += 1 if path[idx] == '#'
    coord_x += 3
  end

  counter
end

p count_the_trees
