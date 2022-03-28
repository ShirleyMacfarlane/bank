require_relative '../lib/account'

class Transaction
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def set(type, amount, balance)
    @transactions.unshift([Time.now.strftime('%d/%m/%Y'), type, amount, balance])
  end

  def get
    @transactions
  end
end
