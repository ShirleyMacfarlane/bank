require_relative '../lib/statement'
require_relative '../lib/transaction'

class Account
  attr_reader :balance, :transaction

  MINIMUM_BALANCE = 0

  def initialize(balance = 0)
    @balance = balance
    @transaction = Transaction.new
  end

  def deposit(amount)
    @balance += amount
    @transaction.set('deposit', amount, @balance)
  end

  def withdraw(amount)
    raise "You do not have sufficient funds to withdraw #{amount}. Your current account balance is #{@balance}" if (@balance - amount) <= MINIMUM_BALANCE

    @balance -= amount
    @transaction.set('withdraw', amount, @balance)
  end
end
