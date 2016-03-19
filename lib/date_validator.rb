# This method takes three arguments: month, date, and year, and returns either TRUE
# or FALSE (the boolean values, not the string representation of those boolean
# values) depending on whether the date is valid (i.e. does exist on the calendar)
# or is not valid (i.e. does not exist on the calendar).
#
# Here are the rules:
#
# + The month must be between 1 and 12 (inclusive)
# + The year must be between 1880 and 2280 (inclusive)
# + The day must exist within the month
# + You must account for leap years (look up how leap years work)
# + No using the `Date` class (we'll refactor to allow the `Date` class later this week)
# + Only worry about integer inputs (no floats, strings, etc.)
#
# This method should, in its final form, not do any output.
require 'pry'

def valid_date? (month, day, year)
  month_length(month) &&
  valid_year(year) &&
  days_in_month(day, month, year) &&
  valid_day(day, month, year) 
end

# determine if months are in range
def month_length(month)
  month >= 1 && month <= 12    
end 

# determine if the year is within the allowed range
def valid_year(year)  
  year >= 1880 && year <=2280  
end

# determining the days in each month
def days_in_month(day, month, year)
    days_month ={
                  1 => 31,
                  2 => february_valid(year),
                  3 => 31,
                  4 => 30,
                  5 => 31,
                  6 => 30,
                  7 => 31,
                  8 => 31,
                  9 => 30,
                  10 => 31,
                  11 => 30,
                  12 => 31,
                }
    days_month[month]
end

#determines if day is valid
def valid_day(day, month, year)
    day >= 1 && day <= days_in_month(day, month, year)
end


# determining leap year by checking days in February
def february_valid(year)
  if leap_year(year)
    days_in_february = 29
  else 
    days_in_february = 28
  end
end

# determine what a leap year is
def leap_year(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 !=0)
end 