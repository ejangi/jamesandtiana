class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :contributions
  has_many :admissions
  
  before_save :generate_key
  
  def generate_key
    str = email.to_s + 'ruBi5H_1n_th3_STRIng' + email.to_s
    self.key = Digest::SHA1.hexdigest(str)
  end
  
  def admit_to_registry(registry)
    self.admissions.find_or_create_by_registry_id(registry.id)
  end
end
