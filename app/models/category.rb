class Category < ApplicationRecord
  validates :name, presence: { message: 'name_can_not_blank' }
  validates_uniqueness_of :name, message: 'name_has_already_existed'

  has_many :devices, dependent: :destroy
end
