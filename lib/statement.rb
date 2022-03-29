require_relative '../lib/account'
require_relative '../lib/transaction'

class Statement
  attr_reader :statement

  def initialize(account)
    @account = account
    @statement = []
  end

  def print_statement
    header = ['date ||' + ' credit ||' + ' debit ||' + ' balance']
    @statement.push(header)
    transactions = @account.transaction.get
    transactions.each do |transaction|
      @statement.push(format_print(transaction))
    end
    @statement
  end

  private

  def format_print(transaction)
    this_credit = '|| '
    this_debit = ' || || '
    amount = format_currency(transaction[2]).to_s
    transaction[1] == 'withdraw' ? (this_debit = amount + ' || ') : (this_credit = amount)
    [transaction[0] + ' || ' + this_credit + this_debit + format_currency(transaction[3]).to_s]
  end

  def format_currency(amount, decimal_places = 2)
    "%.#{decimal_places}f" % amount.to_f.truncate(decimal_places)
  end
end
