# You are given the following information, but you may prefer to do some research for yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


# Will not use builtin date functions for the sake of the exercise

class Sunday
  attr_accessor :day, :month, :year, :days_from_first_known_sunday
  MOS_30 = [4, 6, 9, 11]

  def initialize(year, month, day)
    @year, @month, @day = year, month, day
    @days_from_first_known_sunday = 0
  end

  def next_day!
    new_day, new_month, new_year = 1, @month, @year
    
    new_day = @day + 1 if @day < 28 
    new_day = @day + 1 if @day == 28 and @month == 2 and leap_year?
    new_day = @day + 1 if (@day == 28 or day == 29) and @month != 2
    new_day = @day + 1 if @day == 30 and !MOS_30.include?(@month)
    if new_day == 1
      new_month = 1 + @month%12
      if new_month == 1
        new_year = @year + 1
      end
    end
    @day, @month, @year = new_day, new_month, new_year
    @days_from_first_known_sunday += 1
  end
  
  def next_sunday!
    7.times do
      next_day!
    end
  end
    
  def leap_year?
    Sunday.leap_year? @year
  end

  def self.leap_year?(year)
    return false if year%4 != 0
    return true if year%400 == 0
    return false if year%100 == 0
    true
  end
  
  def sunday_first?
    (@day == 1) and (@days_from_first_known_sunday%7 == 0)
  end
  
  def to_s
    weekdays = %w(sun mon tue wed thu fri sat)
    "#{weekdays[ @days_from_first_known_sunday%7 ]}, #{@year}-#{@month}-#{@day}"
  end
end

first_known_sunday = Sunday.new(1900, 1, 7)

sunday_in_20_century = first_known_sunday
while sunday_in_20_century.year == 1900
  sunday_in_20_century.next_sunday!
end

count = 0
while sunday_in_20_century.year <= 2000
  count += 1 if sunday_in_20_century.sunday_first?
  #puts sunday_in_20_century.to_s if sunday_in_20_century.sunday_first?
  sunday_in_20_century.next_sunday!
end
puts "=====> #{count}"
