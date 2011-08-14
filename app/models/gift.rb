class Gift < ActiveRecord::Base
  attr_accessible :title, :description, :store, :colour, :quantity, :price, :ordering, :photo
  belongs_to :registry
  has_many :contributions
  mount_uploader :photo, GiftPhotoUploader
  
  default_scope order("ordering ASC")
  
  validates_presence_of :title
  
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
    
    if !price.nil? && price > amount_contributed
      return false
    else
      return true
    end
  end
  
  def self.ordering_like(id_array)  
    i = 1
    id_array.each do |id|
      begin
        gift = Gift.find_by_id(id)
        gift.ordering = i
        gift.save
        i = i + 2
      rescue Exception => e
      end
    end
    Gift.refresh_ordering
    return true
  end
  
  def self.refresh_ordering
    begin
      gifts = Gift.find(:all)
    rescue Exception => e
      return
    end
    zeros = []
    i = 1
    gifts.each do |gift|
      if gift.ordering == 0
        zeros << gift
      else
        gift.ordering = i
        gift.save
      end
      i = i + 2
    end

    if zeros.length > 0
      zeros.each do |gift|
        gift.ordering = i
        gift.save
        i = i + 2
      end
    end
  end
end
