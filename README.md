# Bank Challenge

## What I tried to do
1. To create some basic the User Stories:
As a < type of user>, I want < some goal >, so that < some reason >

2. Create a domain model diagram. SEE : images folder for domain model

USER STORIES
```
As a bank client
So I can put money into my account
I want to perform a transaction to deposit money into my account

As a bank client
So I can get money out of my account
I want to perform a transaction to withdraw money from my account

As a bank client
So I can see the state of my account
I want to print an account statement

Print format:-
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

HOW TO RUN USING IRB
```
3.0.0 :001 > require "./lib/account"
3.0.0 :002 > require "./lib/transaction"
3.0.0 :003 > require "./lib/statement"
3.0.0 :004 > account = Account.new
3.0.0 :005 > account.deposit(2000)
 => [["28/03/2022", "deposit", 2000, 2000]] 
3.0.0 :006 > account.deposit(1000)
 => [["28/03/2022", "deposit", 1000, 3000], ["28/03/2022", "deposit", 2000, 2000]] 
3.0.0 :007 > account.withdraw(500)
 => [["28/03/2022", "withdraw", 500, 2500], ["28/03/2022", "deposit", 1000, 3000], ["28/03/2022", "deposit", 2000, 2000]] 
3.0.0 :008 > statement = Statement.new(account)
 => #<Statement:0x00000001280b6480 @account=#<Account:0x0000000128087ce8 @balance=2500, @transaction=#<Transaction:0x0000000128087c98 @transactions=[["28/03/... 
3.0.0 :009 > statement.print_statement
 => [["date || credit || debit || balance"], ["28/03/2022 || || 500.00 || 2500.00"], ["28/03/2022 || 1000.00 || || 3000.00"], ["28/03/2022 || 2000.00 || || 2000.00"]] 
3.0.0 :010 > 
````
TESTING (rspec)
````
rspec test coverage:
Finished in 0.00497 seconds (files took 0.10698 seconds to load)
12 examples, 0 failures

COVERAGE: 100.00% -- 108/108 lines in 6 files

rspec tests for Account class
1. .initialize
   'returns an initial balance of zero on creation'
   'increments the balance on creation with the specified argument'
2. .deposit
   'Increments the balance by the amount deposited'
3. .withdraw
   'decrements the balance by the amout withdrawn'
   'it should raise an error if the amount withdrawn exceeds the account balance'

rspec tests for the Transaction class
1. .initialize
   'sets an empty array on creation'
2. .set
  'sets a transaction'
3. .get
   'gets a transaction'

rspec tests for the Transaction class
 tests for Statement class
1. .print_statement
   'it prints a statement' 
private methods   
2. .format_print
   'it formats a given transaction' 
3 format_currency (Formatted to two decimal places)
   'it returns a value formatted to two decimal places: input with no decimal places' 
   'it returns a value formatted to two decimal places : input with one decimal place'
````
