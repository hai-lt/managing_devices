class SystemconfigController < ApplicationController
  before_action :admin_authentication?
  def system
    @rooms = Room.all
    @lessons = Lesson.all
    @positions = Position.all
    @ranks = Rank.all
    render 'index'
  end

  def registers

  end

  def reports

  end
end
