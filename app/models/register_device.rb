class RegisterDevice < ApplicationRecord
  belongs_to :user
  belongs_to :device
  belongs_to :start_lesson, foreign_key: :from, class_name: 'Lesson'
  belongs_to :finish_lesson, foreign_key: :to, class_name: 'Lesson'
end
