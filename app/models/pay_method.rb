class PayMethod < ApplicationRecord
  belongs_to :account, class_name: 'Account', optional: true

  enum payment_type: { amex: 0, visa: 1, mastercard: 2, discover: 3, paypal: 4, venmo: 5, cash: 6, check: 7, other: 8}
end
