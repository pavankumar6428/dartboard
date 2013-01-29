class Impression < ActiveRecord::Base
  has_many :campaign
  attr_accessible :impression_count, :name, :paid_amount, :payment_type, :user_id
end
