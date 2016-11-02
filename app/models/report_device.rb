class ReportDevice < ApplicationRecord
  belongs_to :rank
  belongs_to :user
  belongs_to :device
end
