class User < ActiveRecord::Base
  has_surveys
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
  has_many :checked_out
  ROLES = %w[admin student]
  before_save do
    #entry = Devise::LDAP::Adapter.get_ldap_entry(self.login)
    #self.name = entry[:displayname][0]
    if self.admin?
      self.role= "admin"
    else
      self.role= "student"
    end
  end
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def role? role
    if self.role == role
      return true
    end
    false
  end
end
