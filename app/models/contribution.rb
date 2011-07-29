class Contribution < ActiveRecord::Base
  belongs_to :gift
  belongs_to :registry
  belongs_to :user
  
  scope :by_amount, lambda {
    order("amount DESC")
  }
end
