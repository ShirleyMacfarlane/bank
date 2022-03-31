require_relative '../lib/account'
require_relative '../lib/statement'

describe Statement do
  let(:account) {double :account}
  subject { Statement.new(account) }

  describe '.print_statement' do 
    it 'it prints a statement' do
      account = double ('account')
      allow(account).to receive(:balance) {0}
      allow(account).to receive(:transactions) {[{:time =>"31/03/2022", :type => "deposit", :amount => 2000, :balance => 2000}]} 
      statement = Statement.new(account)
      expect(account.transactions).to eq ([{:time => "31/03/2022", :type =>"deposit", :amount => 2000, :balance => 2000}])
       expect(statement.print_statement).to eq(
        [{:time=>"31/03/2022", :type => "deposit", :amount => 2000, :balance => 2000}] 
       )
    end
  end

  describe "test the printed output" do
    it 'it should print a header and one transaction' do
      allow(account).to receive(:balance) {0}
      allow(account).to receive(:transactions) {[{:time => "31/03/2022", :type =>"deposit", :amount => 1000, :balance => 1000}]} 
      statement = Statement.new(account)
      expect{ statement.print_statement }.to output("date || credit || debit || balance\n31/03/2022 || 1000.00 || || 1000.00\n").to_stdout
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
