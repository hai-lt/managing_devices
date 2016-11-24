class Lesson < ApplicationRecord
  has_many :register_devices_from, foreign_key: :from, class_name: 'RegisteDevice'
  has_many :register_devices_to, foreign_key: :to, class_name: 'RegisteDevice'

  validates :start, presence: { message: 'start can_not_blank' }
  validates :finish, presence: { message: 'finish can_not_blank' }
end
