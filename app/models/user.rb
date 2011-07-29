class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :contributions
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :admissions
  has_many :registries, :through => :admissions
  has_many :rsvps
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  before_save :generate_key
  
  def generate_key
    str = email.to_s + 'ruBi5H_1n_th3_STRIng' + email.to_s
    self.key = Digest::SHA1.hexdigest(str)
  end
  
  def admit_to_registry(registry)
    self.admissions.find_or_create_by_registry_id(registry.id)
  end
  
  def has_admission_to_registry(registry_permalink)
    registries.permalink_list.include?(registry_permalink.to_s)
  end
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
  
  def address
    self.street + ', ' + self.suburb + ', ' + self.postcode.to_s
  end
  
  def formatted_address
    self.street + "\n" + self.suburb + "\n" + self.postcode.to_s
  end
end
