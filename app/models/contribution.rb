class Contribution < ActiveRecord::Base
  belongs_to :gift
  belongs_to :registry
  belongs_to :user
end
