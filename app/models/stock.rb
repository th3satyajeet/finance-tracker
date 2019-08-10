
class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  def self.new_from_lookup(ticker_symbol)
    begin
      StockQuote::Stock.new(api_key: 'pk_c89c94d3b8284f61bdf92b6b848314b3')
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
    rescue => exception
      return nil
    end
    
  end
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end