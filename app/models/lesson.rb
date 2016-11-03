class Lesson < ApplicationRecord
  has_many :register_devices_from, foreign_key: :from, class_name: 'RegisteDevice'
  has_many :register_devices_to, foreign_key: :to, class_name: 'RegisteDevice'
end
