#!/usr/bin/env ruby
# frozen_string_literal: true

#   Rubyの構文を使用して色々遊んでみる

# 九九表の計算
def kuku
  puts '[九九表の計算]'
  (1..9).each do |i|
    (1..9).each do |j|
      puts "#{i} × #{j} = #{i * j}"
    end
  end
  puts ''
end

$NUMBERS = [3, 5, 7, 4, 2, 1]

# 横グラフ
def graph1
  puts '[横グラフ]'
  $NUMBERS.each do |a|
    (1..a).each do |_dummy|
      print '*'
    end
    puts ''
  end
  puts ''
end

# 横グラフ(逆向き)
def graph2
  puts '[横グラフ(逆向き)]'
  max = $NUMBERS.max
  # 配列長用のループ
  $NUMBERS.each do |num|
    # 配列内部の最大値分ループ(逆順 大→小)
    (1..max).reverse_each do |i|
      if num >= i
        print '*'
      else
        print ' '
      end
    end
    puts ''
  end
  puts ''
end

# TODO:縦グラフ
def graph3
  puts '[縦グラフ]'
  max = $NUMBERS.max
  (1..max).each do |i|
    puts 'TODO'
  end
end

if $PROGRAM_NAME == __FILE__
  kuku
  graph1
  graph2
  graph3
end
