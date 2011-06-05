# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.
# 

def palindrome?(num)
  snum = num.to_s
  half = snum.length/2
  h1 = snum[0, half]
  h2 = snum[-half, half]
  #avoiding native reverse method, for the sake of the exercise
  0.upto(half-1) do |i|
    return false if h1[i,1] != h2[-i-1,1]
  end
  true
end

largest = 0
999.downto(100) do |n1|
  n1.downto(100) do |n2|
    num = n1*n2
    if num > largest
      largest = num if palindrome?(num)
    end
  end
end

puts largest

