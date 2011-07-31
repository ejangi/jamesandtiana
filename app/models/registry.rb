class Registry < ActiveRecord::Base
  has_many :gifts
  has_many :contributions
  has_many :admissions
  has_many :users, :through => :admissions
  has_many :rsvps
  
  mount_uploader :map_photo, RegistryMapPhotoUploader
  
  validates_presence_of :permalink
  
  scope :list, lambda {
    order("created_at ASC")
  }
  
  scope :in_order, lambda {
    order("when ASC")
  }
  
  scope :in_reverse_order, lambda {
    order("when DESC")
  }
  
  def self.permalink_list
    registries = self.all
    list = registries.collect { |r| r.permalink }
    return list
  end
  
  def to_param
    permalink
  end
end
