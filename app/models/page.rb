class Page < ActiveRecord::Base
  validates_presence_of :title, :permalink
  
  def to_param
    permalink
  end
end
