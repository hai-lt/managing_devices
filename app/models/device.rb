class Device < ApplicationRecord
  belongs_to :category
  # belongs_to :room
  # belongs_to :reporter, foreign_key: :reporter_id, class_name: :user

  has_many :register_devices, dependent: :destroy
  has_many :registers, through: :register_devices, source: :user
  has_many :report_devices, dependent: :destroy
  has_many :reporters, through: :report_devices, source: :user
  has_many :ranks, through: :report_devices, foreign_key: :rank_id, source: :rank

  validates :name, presence: { message: 'name_can_not_blank' }
  # validates :price, presence: { message: 'price_can_not_blank' }
  # validates :date_import, presence: { message: 'date_import_can_not_blank' }
end
