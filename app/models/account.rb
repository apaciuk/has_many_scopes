class Account < ApplicationRecord
    has_many :addresses, dependent: :destroy, class_name: 'Address'
    has_many :pay_methods, dependent: :destroy, class_name: 'PayMethod'

    has_one :billing_address, -> { where(address_type: :billing) }, class_name: 'Address'  #  scope :billing
    has_one :shipping_address, -> { where(address_type: :shipping) }, class_name: 'Address'  #  scope :shipping
    has_one :payment_type, -> { where(payment_type: :amex) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :visa) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :mastercard) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :discover) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :paypal) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :venmo) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :cash) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :check) }, class_name: 'PayMethod'  #  scope :payment_type
    has_one :payment_type, -> { where(payment_type: :other) }, class_name: 'PayMethod'  #  scope :payment_type

    enum account_type: { customer: 0, vendor: 1, employee: 2, admin: 3 }

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :account_type, presence: true

    #  If devise is used for authentication, then the following may be needed:
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash['info']['email']).first_or_create do |account|
            account.password = SecureRandom.hex
            account.first_name = auth_hash['info']['first_name']
            account.last_name = auth_hash['info']['last_name']
        end
    end
end