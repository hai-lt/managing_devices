class User < ApplicationRecord
  has_secure_password
  before_save :before_save
  has_many :access_tokens, dependent: :destroy

  validates :password_confirmation, presence: { message: 'User: password_confirmation can not be blank' }

  def admin?
    self.role == 'admin'
  end

  def vih?
    true if self.email.include? 'vihicle'
  end
  private

    def before_save
      self.role.downcase! if self.role
    end
end
