x = -90
y = -90
offset = 70

list = [5, 7, 9, 21]

move_to(x, y)

list.each do |n|
  angle = 180 - 180 / n
  
  pen_down
  
  n.times do |i|
    forward 100
    turn_left angle
  
    if i == n - 1
      x += offset
      y += offset
      pen_up
      move_to(x, y)
    end
  end
end