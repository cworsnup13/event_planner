class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :userID
      t.string :eventName
      t.string :eventDate
      t.integer :attendeeCount
      t.string :attendeeList
      t.string :colorScheme
      t.string :vendors
      t.string :notes
      t.string :todoList

      t.timestamps
    end
  end
end
