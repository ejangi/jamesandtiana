class Gift < ActiveRecord::Base
  belongs_to :registry
  has_many :contributions
  mount_uploader :photo, GiftPhotoUploader
end
