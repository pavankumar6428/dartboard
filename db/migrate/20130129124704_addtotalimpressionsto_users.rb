class AddtotalimpressionstoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :total_impressions, :number
  end

end
