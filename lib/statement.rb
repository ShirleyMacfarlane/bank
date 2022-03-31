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
      amount = format_currency(transaction[:amount]).to_s
      transaction[:type] == 'withdraw' ? (this_debit = amount + ' || ') : (this_credit = amount)
      print "#{transaction[:time]} || #{this_credit}#{this_debit}#{format_currency(transaction[:balance]).to_s}\n"
    end
  end

  private

  def format_currency(amount, decimal_places = 2)
    "%.#{decimal_places}f" % amount.to_f.truncate(decimal_places)
  end
end
