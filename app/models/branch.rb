class Branch < ActiveRecord::Base
  has_and_belongs_to_many :campaigns
  set_primary_key :id

  scope :operational, where(:flag_operational => 'Y')
  scope :only_branches, where("category IN ('P', 'S')")

end