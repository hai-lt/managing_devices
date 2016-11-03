class RegisterDevice < ApplicationRecord
  belongs_to :user
  belongs_to :device
  belongs_to :start_lesson, foreign_key: :from, source: :lesson
  belongs_to :finish_lesson, foreign_key: :to, source: :lesson
end
