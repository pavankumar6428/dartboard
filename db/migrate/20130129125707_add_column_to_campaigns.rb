class AddColumnToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :impressions_used, :number
    add_column :campaigns, :status, :number
  end
end
