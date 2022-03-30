require_relative '../lib/transaction'

describe Transaction do
  let(:transaction) {Transaction.new("deposit", 1000, "29/03/2022")}
  context "initialize" do
    it 'sets a transaction type' do
      expect(transaction.type).to eq("deposit")
    end
    it 'sets a transaction amount' do
      expect(transaction.amount).to eq(1000)
    end
    it 'sets a transaction time' do
      expect(transaction.time).to eq("29/03/2022")
    end
  end
end