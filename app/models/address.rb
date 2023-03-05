class Address < ApplicationRecord
  belongs_to :account, class_name: 'Account'

  enum address_type: { billing: 0, shipping: 1 }
 
end