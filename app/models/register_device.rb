class RegisterDevice < ApplicationRecord
  before_create :default_value
  belongs_to :user
  belongs_to :device
  belongs_to :start_lesson, foreign_key: :from, class_name: 'Lesson'
  belongs_to :finish_lesson, foreign_key: :to, class_name: 'Lesson'

  def default_value
    self.status = 'pending'
  end
end
