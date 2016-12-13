class User < ApplicationRecord
  has_secure_password
  before_save :before_save
  belongs_to :position
  has_many :register_devices
  has_many :registers, through: :register_devices, foreign_key: :user_id, source: :device
  has_many :devices, -> { where(positions: { position: 'md' }) }
  has_many :report_devices
  has_many :reports, through: :report_devices, foreign_key: :device_id, source: :device

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
