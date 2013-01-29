class CreateCampaignsBranchesTable < ActiveRecord::Migration
  def up
  	create_table :branches_campaigns, :id => false do |t|
        t.references :campaign
        t.references :branch
    end
    add_index :branches_campaigns, [:campaign_id, :branch_id]
    add_index :branches_campaigns, [:branch_id, :campaign_id]
  end

  def down
  	drop_table :branches_campaigns
  end
end
