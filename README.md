# Bank Challenge

## What I tried to do
1. To create some basic the User Stories:
As a < type of user>, I want < some goal >, so that < some reason >

2. Create a domain model diagram. SEE : images folder for domain model
I have three different classes : 
Account Class - Responsible for maintaining the account balance.
Transaction Class - Responsible for maintaining transaction information
Statement Class - Responsible for printing statement

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
See screen shot in images folder
```
shirleymacfarlane@Shirleys-MacBook-Air bank % irb
3.0.0 :001 > require "./lib/account"
 => true 
3.0.0 :002 > account = Account.new
 => #<Account:0x000000012d306f50 @balance=0, @transactions=[]> 
3.0.0 :003 > account.deposit(1000)
 => [["29/03/2022", "deposit", 1000, 1000]] 
3.0.0 :004 > account.deposit(2000)
 => [["29/03/2022", "deposit", 1000, 1000], ["29/03/2022", "deposit", 2000, 3000]] 
3.0.0 :005 > account.withdraw(500)
 => [["29/03/2022", "deposit", 1000, 1000], ["29/03/2022", "deposit", 2000, 3000], ["29/03/2022", "withdraw", 500, 2500]] 
3.0.0 :006 > s = Statement.new(account)
 => #<Statement:0x000000012d017f38 @account=#<Account:0x000000012d306f50 @balance=2500, @transactions=[["29/03/2022", "deposit", 1000, 1000], ["29/03/2022",... 
3.0.0 :007 > s.print_statement
date || credit || debit || balance
29/03/2022 || || 500.00 || 2500.00
29/03/2022 || 2000.00 || || 3000.00
29/03/2022 || 1000.00 || || 1000.00
 => [["29/03/2022", "withdraw", 500, 2500], ["29/03/2022", "deposit", 2000, 3000], ["29/03/2022", "deposit", 1000, 1000]] 
3.0.0 :008 > 
````
TESTING (rspec)
See screen shot in images folder
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
   'sets a transaction type' 
   'sets a transaction amount'  
   'sets a transaction time'

rspec tests for the Statement class 
1. .print_statement
   'it prints a statement'
2. test the printed output
   'it should print a header and one transaction'   

private method
3 format_currency (Formatted to two decimal places)
   'it returns a value formatted to two decimal places: input with no decimal places' 
   'it returns a value formatted to two decimal places : input with one decimal place'
````
