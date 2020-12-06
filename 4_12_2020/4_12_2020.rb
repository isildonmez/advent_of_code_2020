def count_valid_passports
  File.open("./4_12_2020.txt").each_line("\n\n").lazy
      .map{|line| num_of_fields(line)}
      .select{|n| n == 7 }
      .count
end

def num_of_fields(line)
  line.tr("\n", ' ')
    .split(' ')
    .map do |s|
      key = s[/^[^:]+/]
      key == 'cid' ? '' : key
    end.reject(&:empty?).length
end

p count_valid_passports
