def count_valid_passports
  counter = 0

  File.open("./4_12_2020.txt").each_line("\n\n") do |line|
    fields =  line.tr("\n", ' ').split(' ').map{ |s| s[/^[a-z]+/] }
    num_of_fields = fields.length

    if num_of_fields == 8 || (num_of_fields == 7 && !(fields.include? 'cid') )
      counter += 1
    end
  end

  counter
end

p count_valid_passports
