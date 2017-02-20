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

class Currency_converter
  def initialize
    @exchange_rates = {
      "USD" => 1,
      "EUR" => 0.941080,
      "ARS" => 15.7100,
      "MNT" => 2481.51,
      "XPT" => 0.000995107
    }
  end

  def convert(currency, currency_code)
    rate = @exchange_rates[currency_code]/@exchange_rates[currency.currency_code]
    return Currency.new(currency_code, currency.ammount * rate)
  end
end


# test_currency = Currency.new("USD", 10)
other_currency = Currency.new("USD", 20)
converter = Currency_converter.new
puts (converter.convert(other_currency, "USD")).ammount
