require_relative '../lib/account'

describe Account do
  subject { Account.new }
  time = Time.now.strftime('%d/%m/%Y')

  describe '.initialize' do
    it 'returns an initial balance of zero on creation' do
      expect(subject.balance).to eq(0.00)
    end
  end

  describe '.initialize' do
    subject { Account.new(5.25) }
    it 'increments the balance on creation with the specified argument' do
      expect(subject.balance).to eq(5.25)
    end
  end

  describe '.deposit' do
    subject { Account.new(10.00) }
    it 'increments the balance by the amount deposited' do
      subject.deposit(3.20)
      expect(subject.balance).to eq(13.20)
    end
  end

  describe '.withdraw' do
    it 'decrements the balance by the amout withdrawn' do
      subject.deposit(500)
      subject.withdraw(200)
      expect(subject.balance).to eq(300)
    end
    it 'it should raise an error if the amount withdrawn exceeds the account balance' do
      expect { subject.withdraw(500) }.to raise_error('You do not have sufficient funds to withdraw 500. Your current account balance is 0')
    end
  end
end
