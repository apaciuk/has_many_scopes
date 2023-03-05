class CreatePayMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_methods do |t|
      t.references :account, foreign_key: true, class_name: 'Account', index: true
      t.integer :payment_type, null: false, default: 0

      t.timestamps
    end
  end
end
