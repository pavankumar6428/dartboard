class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.integer :impression_id
      t.integer :impression_count
      t.date :start_date
      t.string :time_frame
      t.integer :user_id

      t.timestamps
    end
  end
end
