require_relative '../lib/account'
require_relative '../lib/transaction'

class Statement
  attr_reader :statement

  def initialize(account)
    @account = account
  end

  def print_statement
    print "date || credit || debit || balance\n"
    transactions = @account.transactions
    transactions = transactions.reverse
    transactions.each do |transaction|
      this_credit = '|| '
      this_debit = ' || || '
      amount = format_currency(transaction[2]).to_s
      transaction[1] == 'withdraw' ? (this_debit = amount + ' || ') : (this_credit = amount)
      print "#{transaction[0]} || #{this_credit}#{this_debit}#{format_currency(transaction[3]).to_s}\n"
    end
    #nil
  end

  private

  def format_currency(amount, decimal_places = 2)
    "%.#{decimal_places}f" % amount.to_f.truncate(decimal_places)
  end
end
