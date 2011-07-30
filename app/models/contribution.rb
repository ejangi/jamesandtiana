class Contribution < ActiveRecord::Base
  belongs_to :gift
  belongs_to :registry
  belongs_to :user
  
  validates :amount, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => { :greater_than => 0, :less_than => 100000 }
  
  scope :by_amount, lambda {
    order("amount DESC")
  }
end
