# By considering the terms in the Fibonacci sequence whose values 
# do not exceed four million, find the sum of the even-valued terms.

fib_prev, fib_curr = 0, 1
def fib_next
  fib_prev, fib_curr = fib_curr, fib_curr+fib_prev
end

1.upto(10) {|n| puts n}