class Campaign < ActiveRecord::Base
  require 'date'

  belongs_to :user, :foreign_key => 'user_id', :autosave => true

  has_and_belongs_to_many :branches
  attr_accessible :campaign_name, :impression_count, :impression_id, :start_date, :time_frame, :user_id, :photo, :branch_ids

  has_attached_file :photo, :styles => { :small => "150x150>" }

  validates :campaign_name, :presence => true
  validates :branch_ids, :presence => true
  validates :user_id, :presence => true
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  validate :start_date_should_be_future
  validate :impression_limit


  # write a validate to have impression_count > available count
  #write  avalidate to have campaig_name
  #start_date > today date
  # display the branches seleted in show

  after_create :decrement_impression


  def impression_limit
  	# errors.add(:impression , "impression limit exceeds") if user.total_impressions.to_i < impression_count || impression_count == 0
  end
  def start_date_should_be_future
  	errors.add(:date , "start date should be in future") unless start_date > Time.zone.today
  end
  def decrement_impression
     self.user.total_impressions = self.user.total_impressions - self.impression_count
  end

end
