# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed data for Customers  table

    first_name = %w(Dean Buddy Miles Billie)
    last_name = %w(Martin Rich Davis Holiday)
    email = %w(dean.martin@culini.com buddy.rich@culini``.com miles.davis@culini.com billie.holiday@culini.com)
    max_id = Customer.all.collect(&:id).max
    if(max_id.nil? or max_id < 4)
    begin
      for customer in 1..4 do
        Customer.find_or_create_by_email(firstname: first_name[customer - 1], lastname: last_name[customer - 1], email:email[customer - 1])
      end
    rescue => e
      puts e.message
    end
  end

# Seed data for charges table

  begin

    # 10 successfull charges
    success_charge_limit = [5,3,1,1]
    for customer_id in 1..4 do
        #Customer_id = Customer.where(id:count) rescue nil
        for charge in (1..success_charge_limit[customer_id - 1]) do
            Charge.create(paid:"true",amount:rand(5000),currency:"usd",refunded: false, customer_id:customer_id)
        end
    end

    # 5 failed charges
      customer_id_list = [3,4]
      failed_limit = [3,2]
    for id in 1..2 do
      for fail_charge in 1..failed_limit[id - 1] do
       Charge.create(paid:"false",amount:rand(5000),currency:"usd",refunded: false, customer_id:customer_id_list[id - 1])
      end
    end

    # 5 disputed charges
      id_list = [1,2]
      disputed_limit = [3,2]
    for disputed_count in 1..2 do
      for dispute_charge in 1..disputed_limit[disputed_count - 1] do
       Charge.create(paid:"disputed",amount:rand(5000),currency:"usd",refunded: false, customer_id:id_list[disputed_count - 1])
      end
    end


  rescue => e
    puts e.message
  end

