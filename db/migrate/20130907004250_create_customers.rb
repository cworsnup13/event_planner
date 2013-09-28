class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :name
      t.string :password
      t.datetime :createdOn

      t.timestamps
    end
  end
end
