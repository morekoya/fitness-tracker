class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker
    stock.where(ticker: ticker_symbol)
  end

  def self.new_form_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    price = (looked_up_stock.latest_price)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, price: price)
  rescue Exception => e
    return nil
  end

  def self.strip_commas(number_as_text)
    number_as_text.gsub(",", "")
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
