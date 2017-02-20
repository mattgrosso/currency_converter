# require_relative "currency"
# require_relative "currenct_converter"

class Currency

  def initialize(currency_code, ammount = 0)
    @currency_code = currency_code
    @ammount = ammount
  end

  def currency_code
    @currency_code
  end

  def ammount
    @ammount
  end

  def == (other)
    if other.currency_code == @currency_code && other.ammount == @ammount
      return true
    end
    return false
  end

  def + (other)
    if other.currency_code == @currency_code
      total = other.ammount + @ammount
      return Currency.new(@currency_code, total)
    end
    raise Exception.new("DifferentCurrencyCodeError")
  end

  def - (other)
    if other.currency_code == @currency_code
      total = other.ammount - @ammount
      return Currency.new(@currency_code, total)
    end
    raise Exception.new("DifferentCurrencyCodeError")
  end

  def * (other)
    product = other * @ammount
    Currency.new(@currency_code, product)
  end

end

test_currency = Currency.new("USD", 10)
other_currency = Currency.new("USD", 20)

puts (test_currency * 10).ammount
puts (other_currency * 12.3).ammount
