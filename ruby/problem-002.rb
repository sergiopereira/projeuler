# By considering the terms in the Fibonacci sequence whose values 
# do not exceed four million, find the sum of the even-valued terms.

class FibSeq
  include Enumerable
  
  def initialize(below)
    @fib_prev, @fib_curr = 1, 1
    @below = below
  end

  def each
    yield @fib_prev
    while @fib_curr < @below
      yield @fib_curr
      @fib_prev, @fib_curr = @fib_curr, @fib_curr+@fib_prev
    end
  end
end

puts FibSeq.new(4_000_000).find_all{|n| n.even? }.inject{|s,n| s+n}
