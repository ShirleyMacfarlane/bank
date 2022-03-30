require_relative '../lib/account'
require_relative '../lib/statement'

describe Statement do
  let(:account) {double :account}
  subject { Statement.new(account) }

  describe '.print_statement' do 
    it 'it prints a statement' do
      account = double ('account')
      allow(account).to receive(:balance) {0}
      allow(account).to receive(:transactions) {[["30/03/2022", "deposit", 1000, 1000]]} 
      statement = Statement.new(account)
      expect(account.transactions).to eq ([["30/03/2022", "deposit", 1000, 1000]])
       expect(statement.print_statement).to eq(
         [["30/03/2022", "deposit", 1000, 1000]]
       )
    end
  end

  describe "test the printed output" do
    it 'it should print a header and one transaction' do
      allow(account).to receive(:balance) {0}
      allow(account).to receive(:transactions) {[["30/03/2022", "deposit", 1000, 1000]]} 
      statement = Statement.new(account)
      expect{ statement.print_statement }.to output("date || credit || debit || balance\n30/03/2022 || 1000.00 || || 1000.00\n").to_stdout
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
