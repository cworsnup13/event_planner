class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.boolean :resolved
      t.timestamp :createdAt

      t.timestamps
    end
  end
end
