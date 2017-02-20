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

  def convert(currency, currency_code = nil)

    if !@exchange_rates[currency_code] && currency_code != nil
      raise Exception.new("UnknownCurrencyCodeError")
    end

    if currency_code
      rate = @exchange_rates[currency_code]/@exchange_rates[currency.currency_code]
      return Currency.new(currency_code, currency.ammount * rate)
    end

    puts "You've given me #{currency.ammount}#{currency.currency_code}. What would you like to change that into?"
    input = gets.chomp

    if !@exchange_rates[input]
      raise Exception.new("UnknownCurrencyCodeError")
    end

    rate = @exchange_rates[input]/@exchange_rates[currency.currency_code]
    return Currency.new(input, currency.ammount * rate)
  end
end
