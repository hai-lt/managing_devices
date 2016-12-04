class SystemconfigController < ApplicationController
  before_action :admin_authentication?
  def system
    @rooms = Room.all
    @room = Room.new
    @lessons = Lesson.all
    @lesson = Lesson.new
    @positions = Position.all
    @position = Position.new
    @ranks = Rank.all
    @rank = Rank.new
    render 'index'
  end

  def registers

  end

  def reports

  end
end
