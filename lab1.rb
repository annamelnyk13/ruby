require 'date'

module Validation
  def self.valid_name?(string)
    return false if string.length > 40

    pattern = /^[a-zA-Z]+-[a-zA-Z]+$/
    return pattern.match?(string)
  end

  def self.valid_inn?(string)
    pattern = /^[A-Z]{2}\d{10}$/
    return pattern.match?(string)
  end

  def self.after_date?(date)
    return date <= Date.today
  end
end

# Використання функцій модуля
puts Validation.valid_name?("Anna-Diana")  # true
puts Validation.valid_name?("Anna Diana")  # false (відсутній дефіс)
puts Validation.valid_name?("ДужеДовгеІм'яПеревищенаМаксимальнаДовжина")  # false (перевищена максимальна довжина)

puts Validation.valid_inn?("AB1234567890")  # true
puts Validation.valid_inn?("AB123")  # false (мало цифр)
puts Validation.valid_inn?("abc1234567890")  # false (не вірний формат)

puts Validation.after_date?(Date.parse("1999-07-15"))  # true
puts Validation.after_date?(Date.today)  # true
puts Validation.after_date?(Date.parse("2050-01-01"))  # false (майбутня дата)