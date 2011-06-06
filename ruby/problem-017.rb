# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there 
# are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of 
# "and" when writing out numbers is in compliance with British usage.

class Fixnum
  def to_english
    return "one thousand" if self == 1000
    result = tens = get_english_tens
    
    if self>99
      result = (self/100).to_english + " hundred"
      result = result + " and " + tens if tens.length>0
    end
    
    result
  end
  
  private 
  def get_english_tens
    tens = self%100
    return "" if tens == 0
    
    singles = %w(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty)
    return singles[tens-1] if tens <= 20
    tenths = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
    return tenths[tens/10-1] if tens%10 == 0
    (10*(tens/10)).to_english + "-" + (tens%10).to_english
  end
end

puts (1..1000).map{|n| n.to_english.gsub(/[\s-]/, '').length}.reduce(:+)