# frozen_string_literal: true

def each_example
  numbers = [1, 2, 3, 4]
  sum = 0
  numbers.each do |n|
    sum += n
  end

  sum
end

def delete_if_example
  a = [1, 2, 3, 4, 5]
  a.delete_if(&:odd?)
  # 上記の構文は以下と同等
  # a.delete_if do |n|
  #  n.odd?
  # end

  a
end

p each_example
p delete_if_example
