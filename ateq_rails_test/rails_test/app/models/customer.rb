class Customer < ActiveRecord::Base
  has_many :charges
  #Return maximum charged amount for customer
  def self.max_charged_amount(customer_id)
   return Customer.where(id:customer_id).first.charges.collect(&:amount).max rescue nil
  end
end
