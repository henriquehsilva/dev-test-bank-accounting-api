class AddClientIdToAccount < ActiveRecord::Migration[6.0]
  change_table :accounts do |t|
    t.belongs_to :customer, null: false, foreign_key: true
  end
end
