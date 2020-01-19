# frozen_string_literal: true

def each_example
  numbers = (1..5).to_a
  sum = 0
  numbers.each do |n|
    sum += n
  end

  sum
end

def delete_if_example
  a = (1..5).to_a
  a.delete_if(&:odd?)
  # 上記の構文は以下と同等
  # a.delete_if do |n|
  #  n.odd?
  # end

  a
end

def map_example
  numbers = (1..5).to_a
  new_numbers = numbers.map { |n| n * 10 }
  new_numbers
end

def select_example
  numbers = (1..5).to_a
  select_numbers = numbers.select(&:even?)
  select_numbers
end

def reject_example
  numbers = (1..5).to_a
  reject_numbers = numbers.reject(&:even?)
  reject_numbers
end

def find_example
  numbers = (1..5).to_a
  ret = numbers.find(&:even?)
  ret
end

p each_example
p delete_if_example
p map_example
p select_example
p reject_example
p find_example
