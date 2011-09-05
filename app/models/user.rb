class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :contributions
  has_many :assignments, :group => "role_id"
  has_many :roles, :through => :assignments, :group => "name"
  has_many :admissions
  has_many :registries, :through => :admissions
  has_many :rsvps
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  before_save :generate_key, :set_roles
  
  scope :absentees, lambda { find_by_sql("SELECT users.id, users.name, users.email, rsvps.attending
  FROM users
  LEFT JOIN rsvps ON rsvps.user_id = users.id
  WHERE rsvps.attending IS NULL
  GROUP BY users.id") }
  
  
  
  def self.find_by_role(role)
    find_by_sql(["SELECT users.* FROM users
    LEFT JOIN assignments ON (assignments.user_id = users.id)
    LEFT JOIN roles ON (assignments.role_id = roles.id)
    WHERE roles.name = ?
    GROUP BY users.id", role.to_s])
  end
  
  def admit_to_registry(registry)
    self.admissions.find_or_create_by_registry_id(registry.id)
  end
  
  def has_admission_to_registry(registry)
    registries.permalink_list.include?(registry.permalink.to_s)
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
  
  def generate_key
    str = email.to_s + 'ruBi5H_1n_th3_STRIng' + email.to_s
    self.key = Digest::SHA1.hexdigest(str)
  end
  
  def set_roles
    admissions.each do |admit|
      self.roles << Role.find_or_create_by_name(admit.registry.permalink)
    end
  end
end
