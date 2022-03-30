require_relative '../lib/statement'
require_relative '../lib/transaction'

class Account
  attr_reader :balance, :transactions

  MINIMUM_BALANCE = 0

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new('deposit', amount, Time.now.strftime('%d/%m/%Y'))
    store_transaction(transaction)
  end

  def withdraw(amount)
    raise "You do not have sufficient funds to withdraw #{amount}. Your current account balance is #{@balance}" if (@balance - amount) <= MINIMUM_BALANCE

    @balance -= amount
    transaction = Transaction.new('withdraw', amount, Time.now.strftime('%d/%m/%Y'))
    store_transaction(transaction)
  end

  private

  def store_transaction(transaction)
    this_transaction = [transaction.time, transaction.type, transaction.amount, @balance]
    @transactions.push(this_transaction)
  end
end
