def count_valid_passports
  counter = 0

  File.open("./4_12_2020.txt").each_line("\n\n") do |line|
    fields_with_values =  get_fields_with_values(line)
    has_all_fields = fields_with_values.length == 7
    values_are_valid = fields_with_values.all? { |k, v| check_validity(k, v) }

    counter += 1 if has_all_fields && values_are_valid
  end

  counter
end

def get_fields_with_values(line)
  fields = Hash[*(line.tr(":\n", '  ').split(' '))]
  fields.delete('cid')
  fields
end

def check_validity(key, value)
  case key
  when 'byr'
    value.to_i.between?(1920, 2002)
  when 'iyr'
    value.to_i.between?(2010, 2020)
  when 'eyr'
    value.to_i.between?(2020, 2030)
  when 'hgt'
    unit = value[(/(cm|in)/)]
    if unit == 'cm'
      value[/\d+/].to_i.between?(150, 193)
    elsif unit == 'in'
      value[/\d+/].to_i.between?(59, 176)
    else
      false
    end
  when 'hcl'
    value.length == 7 && value[/#[0-9a-f]+/] == value
  when 'ecl'
    value[(/(amb|blu|brn|gry|grn|hzl|oth)/)]
  when 'pid'
    value.length == 9 && value[/\d+/] == value
  end
end

p count_valid_passports
