class Rank < ApplicationRecord
  has_many :report_devices, dependent: :destroy
end
