class Registry < ActiveRecord::Base
  attr_accessible :title, :introduction, :when, :permalink, :show_number_of_gifts, :show_dietary_requirements, :map_photo, :map_url, :address, :details, :gift_registry_introduction, :photo
  
  has_many :gifts
  has_many :contributions
  has_many :admissions
  has_many :users, :through => :admissions
  has_many :rsvps
  
  mount_uploader :map_photo, RegistryMapPhotoUploader
  mount_uploader :photo, RegistryPhotoUploader
  
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
  
  def people_attending
    rsvps.attending.sum(:number_of_guests)
  end
  
  def self.permalink_list
    registries = self.all
    list = registries.collect { |r| r.permalink }
    return list
  end
  
  def to_param
    permalink
  end
end
