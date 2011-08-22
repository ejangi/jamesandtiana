class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :registry
  
  scope :by_attending, lambda {
    includes(:registry).order("registries.id, rsvps.attending DESC")
  }
  
  scope :attending, where("rsvps.attending = 1")
end
