def count_valid_passwords
  counter = 0
  File.open("./2_12_2020.txt", "r").each_line do |line|
    min, max, letter, string = line.tr('-', ' ').split(' ')
    counter += 1 if string.count(letter).between?(min.to_i, max.to_i)
  end

  counter
end

p count_valid_passwords
