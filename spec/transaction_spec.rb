require_relative '../lib/transaction'

describe Transaction do
  subject { Transaction.new }
  time = Time.now.strftime('%d/%m/%Y')

  describe '.initialize' do
    it 'sets an empty array on creation' do
      expect(subject.transactions.length).to be 0
    end
  end

  describe '.set' do
    it 'sets a transaction' do
      expect(subject.set('withdraw', 10, 5)).to eq([[time, 'withdraw', 10, 5]])
    end

    it 'gets a transaction' do
      subject.set('withdraw', 10, 5)
      expect(subject.get).to eq([[time, 'withdraw', 10, 5]])
    end
  end
end
