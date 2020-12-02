def count_valid_passwords
  counter = 0
  File.open("./2_12_2020.txt", "r").each_line do |line|
    position_1, position_2, letter, string = line.tr('-:', ' ').split(' ')
    idx_1, idx_2 = convert_to_idx([position_1, position_2])

    first_condition = string[idx_1] == letter
    second_condition = string[idx_2] == letter
    counter += 1 if first_condition != second_condition
  end

  counter
end

def convert_to_idx(positions)
  positions.map{|pos| pos.to_i - 1}
end

p count_valid_passwords
