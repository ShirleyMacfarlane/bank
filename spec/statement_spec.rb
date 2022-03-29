require_relative '../lib/account'
require_relative '../lib/statement'

describe Statement do
  subject { Statement.new(Account.new) }

  describe '.print_statement' do
    it 'it prints a statement' do
      time = Time.now.strftime('%d/%m/%Y')
      account = Account.new
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq(
        [['date || credit || debit || balance'],
         ["#{time} || || 500.00 || 2500.00"],
         ["#{time} || 2000.00 || || 3000.00"],
         ["#{time} || 1000.00 || || 1000.00"]]
      )
    end
  end

  describe '.format_print' do
    it 'it formats a given transaction' do
      result = subject.send(:format_print, ['28/03/2022', 'deposit', 5, 10])
      expect(result).to eq(['28/03/2022 || 5.00 || || 10.00'])
    end
  end

  describe '.format_currency' do
    it 'it returns a value formatted to two decimal places: input with no decimal places' do
      result = subject.send(:format_currency, 30)
      expect(result).to eq('30.00')
    end
    it 'it returns a value formatted to two decimal places : input with one decimal place' do
      result = subject.send(:format_currency, 30.1)
      expect(result).to eq('30.10')
    end
  end
end
