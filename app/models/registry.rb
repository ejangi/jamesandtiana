class Registry < ActiveRecord::Base
  has_many :gifts
  has_many :contributions
end
