class Registry < ActiveRecord::Base
  has_many :gifts
  has_many :contributions
  
  scope :all, lambda {
    order("created_at ASC")
  }
  
  def self.titles_list
    registries = self.all
    list = registries.collect { |r| r.title }
    return list
  end
end
