# Rails Programming Task

### In order to be considered for a rails position, you must complete the following steps.
*Note: This task should take no longer than 1-2 hours at the most to complete.*


### Prerequisites

- Please note that this will require some basic [Ruby on Rails](http://rubyonrails.org/) and [RSpec](http://rspec.info/) knowledge.

- You will need to have [Ruby on Rails](http://www.rubyonrails.org/) installed to complete this task.

## Task

- Fork this repository (if you don't know how to do that, Google is your friend)
- Create a *source* directory.
- In the *source* directory, build a simple Rails 4 web app that models a credit card charge. Follow the data structure below:

```
  {
    "id": 9923,
    "created_at": "2014-01-20 09:45",
    "updated_at": "2014-01-20 09:46",
    "paid": true,
    "amount": 4900,
    "currency": "usd",
    "refunded": false,
    "customer_id" : 123
  }
```

    *Note: Amount is in USD, cents*

- Also implement a customer object which stores a first and last name and an email.

- The customer model should have a method that returns a single associated charge object. The returned charge object must have the largest amount attribute out of any associated charges.

*The charge object has a customer association, this association is the customer id from the customer model.*

##### Seed 4 Customers into the system

    Customer 1:
      First Name: Dean
      Last Name: Martin
      Email: dean.martin@culini.com

    Customer 2:
      First Name: Buddy
      Last Name: Rich
      Email: buddy.rich@culini.com

    Customer 3:
      First Name: Miles
      Last Name: Davis
      Email: miles.davis@culini.com

    Customer 4:
      First Name: Billie
      Last Name: Holiday
      Email: billie.holiday@culini.com


##### Seed 20 charges into the system

    10 Should be successful charges:
      - 5 Should be linked to Customer 1
      - 3 Should be linked to Customer 2
      - 1 Should be linked to Customer 3
      - 1 Should be linked to Customer 4

    5 Should be charges that failed:
      - 3 Should be linked to Customer 3
      - 2 Should be linked to Customer 4

    5 should be disputed:
      - 3 should be linked to Customer 1
      - 2 should be linked to customer 2


##### Create a Visual Representation of Different Charges
On the view that shows all charges (most likely the *GET /charges* route), create three lists with H1 headers.

- List 1 -
  - Header: Failed Charges
  - In this list set the background color of the rows to #FF0000 and list the Customers name, the charge amount and the date that the charge failed for each failed charge.

- List 2 -
  - Header: Disputed Charges
  - In this list set the background color of the rows to ##FF5400 and list hte Customers name, the charge amount and the date that the charge was disputed for each disputed charge.

- List 3 -
  - Header: Successful Charges
  - In this list simply display all the charges that were succesfull.

### Charge creation
On the view to create a new charge (most likely the *GET /charges/new* route), create a form for submitting new charges. The form should perform the following way:

- Have a select drop down field with a list of existing customers
- Have an amount text field
- Have a select drop down field with the following currencies: "usd", "gbp", "eur", "inr"

When a user submits the form, it should make a POST request to the `create` action on the controller. The create action should perform any necessary actions to propery store the submitted data in the database, then redirect the user to the index action for charges.

### Tests

Create the following RSpec tests:

  1.  Verify that there are three lists on the screen. One for Successful charges, one for failed charges and one for the disputed charges.
  2.  Verify that in the Successful charges list there are 10 line items. Verify that in the failed charges list there are 5 failed charges. Verify that in the disputed charges list there are failed charges.

## Once Complete
1. Commit and Push your code to your new repository
2. Send us a pull request, we will review your code and get back to you
