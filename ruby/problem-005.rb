# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


prime_incr = 19*17*13*11*7*5*3*2
max = (1..20).inject{ |c,n| c*n }

prime_incr.step(max, prime_incr) do |curr| 
  #puts curr
  if (1..20).all?{ |n| curr%n == 0}
    puts "==> #{curr}"
    break
  end
end
puts "max: #{max}"