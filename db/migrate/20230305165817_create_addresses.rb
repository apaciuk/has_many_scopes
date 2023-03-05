class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :account, foreign_key: true, class_name: 'Account', index: true
      t.integer :address_type, null: false, default: 0

      t.timestamps
    end
  end
end
