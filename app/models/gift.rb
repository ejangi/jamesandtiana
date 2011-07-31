class Gift < ActiveRecord::Base
  attr_accessible :photo
  belongs_to :registry
  has_many :contributions
  mount_uploader :photo, GiftPhotoUploader
  
  def amount_contributed
    contributions.sum(:amount)
  end
  
  def users_contributed
    contributions.collect { |c| c.user_id }
  end
  
  def contributed?(user=nil)
    if !user.nil? && users_contributed.include?(user.id)
      return false
    end
    
    if self.price > amount_contributed
      return false
    else
      return true
    end
  end
end
