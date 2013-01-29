class CreateImpression < ActiveRecord::Migration
  def change
    create_table :impression do |t|
      t.string :name
      t.integer :impression_count
      t.integer :user_id
      t.integer :paid_amount
      t.string :payment_type

      t.timestamps
    end
  end
end
