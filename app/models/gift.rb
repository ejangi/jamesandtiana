class Gift < ActiveRecord::Base
  attr_accessible :photo
  belongs_to :registry
  has_many :contributions
  mount_uploader :photo, GiftPhotoUploader
  
  def amount_contributed
    contributions.sum(:amount)
  end
  
  def contributed?
    if self.price > amount_contributed
      return false
    else
      return true
    end
  end
end
