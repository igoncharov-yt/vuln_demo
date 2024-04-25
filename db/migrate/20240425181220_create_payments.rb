class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.bigint :sender_id
      t.bigint :recipient_id
      t.string :comment
      t.integer :amount

      t.timestamps
    end
  end
end
