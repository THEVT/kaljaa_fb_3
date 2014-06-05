class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :pw
      t.string :tv
      t.string :session_id
      t.string :authorization
      t.integer :enabled

      t.timestamps
    end
	
	add_column :accounts, :enabled, :integer, default: 1

  end
end
