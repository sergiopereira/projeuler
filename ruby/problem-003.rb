#  The prime factors of 13195 are 5, 7, 13 and 29.
#  What is the largest prime factor of the number 600851475143 ?

NUM2 = 600851475143
NUM1 = 13195

class PrimeStore
  def initialize
    @known_primes = [ 2, 3 ]
  end
  
  def prime?(number)
    if number <= @known_primes.last
      return @known_primes.include?(number)
    end  

    return false if @known_primes.any?{|p| number%p == 0}

    (@known_primes.last+2).step(number-1, 2).each do |n|
      @known_primes << n if @known_primes.none?{|p| n%p == 0}
      return false if number%n == 0
    end
    @known_primes << number
    true
  end
  
end

@primes = PrimeStore.new

def prime_factors (number)
  return [number] if @primes.prime?(number)
  primes = primes_below(Math.sqrt(number))
  primes.find_all{|p| number%p == 0}
end

def primes_below (below)
  nums = []
  2.upto(below) do |n|
    isprime = @primes.prime?(n)
    nums << n if isprime
  end
  nums
end


prime_factors(NUM2).each{|n| puts n}

