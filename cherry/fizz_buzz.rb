def fizz_buzz(num)
    if num % 15 == 0
        puts 'FizzBuzz'
    elsif num % 3 == 0
        puts 'Fizz'
    elsif num % 5 == 0
        puts 'Buzz'
    else
        puts num
    end
end

(1..20).each{|num|
    fizz_buzz(num)
}