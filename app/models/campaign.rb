class Campaign < ActiveRecord::Base
  require 'date'

  belongs_to :user, :foreign_key => 'user_id', :autosave => true
  has_and_belongs_to_many :branches

   attr_accessible :campaign_name, :impression_count, :impression_id, :start_date, :time_frame, :user_id, :photo, :branch_ids

  has_attached_file :photo, :styles => { :small => "150x150>" }


  validates :campaign_name, :presence => true
  validates :branch_ids, :presence => true
  validates :user_id, :presence => true
  validates :start_date, :presence => true
  validates :impression_count, :presence => true
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validate :impression_limit
  validate :start_date_should_be_future

  set_date_columns :start_date

  after_create { decrement_impression }

  def impression_limit
    if user && impression_count
  	   errors.add(:impression , " count limit exceeds or is zero ") if user.total_impressions.to_i < impression_count || impression_count == 0
    else
      errors.add(:user_id , " or impression_count should not be null")
    end
  end

  def start_date_should_be_future
    if start_date
  	  errors.add(:start_date , " should be in future") unless start_date > Time.zone.today
    end
  end

  def decrement_impression
     user.total_impressions = user.total_impressions - impression_count
     user.save
  end

  def self.build(params)
    Campaign.new(params).tap do |c|
  
      c.user_id = params["user_id"]

    end
  end

end
