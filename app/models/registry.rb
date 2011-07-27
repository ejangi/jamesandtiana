class Registry < ActiveRecord::Base
  has_many :gifts
  has_many :contributions
  has_many :admissions
  has_many :users, :through => :admissions
  
  scope :list, lambda {
    order("created_at ASC")
  }
  
  def self.permalink_list
    registries = self.all
    list = registries.collect { |r| r.permalink }
    return list
  end
end
