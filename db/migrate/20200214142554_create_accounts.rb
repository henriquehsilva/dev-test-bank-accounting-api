class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :number
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
