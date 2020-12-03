def count_the_trees(right, down)
  counter = 0
  coord_x = right

  File.open('./3_12_2020.txt').each_with_index do |line, line_idx|
    next if line_idx == 0
    next if line_idx % down !=  0

    path = line.strip
    idx = coord_x % path.length
    counter += 1 if path[idx] == '#'
    coord_x += right
  end

  counter
end

def product_of_all_paths
  product = 1
  [[1,1], [3,1], [5,1], [7,1], [1,2]].each do |arr|
    product = product * count_the_trees(arr[0], arr[1])
  end
  product
end

p product_of_all_paths

