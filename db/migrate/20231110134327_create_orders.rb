class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method, null: false
      t.string :post_code, null: false
      t.text :address, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
