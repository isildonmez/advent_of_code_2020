def count_valid_passports
  counter = 0

  File.open("./4_12_2020.txt").each_line("\n\n") do |line|
    fields =  find_fields(line)
    num_of_fields = fields.length
    counter += 1 if num_of_fields == 7
  end

  counter
end

def find_fields(line)
  line.tr("\n", ' ')
    .split(' ')
    .map do |s|
      key = s[/^[a-z]+/]
      key == 'cid' ? '' : key
    end.reject(&:empty?)
end

p count_valid_passports
