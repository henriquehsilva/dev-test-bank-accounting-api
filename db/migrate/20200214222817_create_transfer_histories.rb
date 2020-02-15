class CreateTransferHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :transfer_histories do |t|
      t.string :source_account_id
      t.string :destination_account_id
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
