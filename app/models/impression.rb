class Impression < ActiveRecord::Base

  belongs_to :user, :foreign_key => 'user_id', :autosave => true

  attr_accessible :impression_count, :name, :paid_amount, :payment_type, :user_id

  after_create :increment_impression

  def increment_impression
     user.total_impressions = user.total_impressions + impression_count
     user.save
  end
end
