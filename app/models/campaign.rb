class Campaign < ActiveRecord::Base
  belongs_to :impression
  has_and_belongs_to_many :branches
  attr_accessible :campaign_name, :impression_count, :impression_id, :start_date, :time_frame, :user_id, :photo, :branch_ids

  has_attached_file :photo, :styles => { :small => "150x150>" }

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


  # write a validate to have impression_count > available count
  #write  avalidate to have campaig_name
  #start_date > today date
  # display the branches seleted in show
  # change signup page
  # 

end
