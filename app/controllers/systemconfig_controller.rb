class SystemconfigController < ApplicationController
  before_action :admin_authentication?
  def system
    @rooms = Room.all.order(:id)
    @lessons = Lesson.all.order(:code)
    @positions = Position.all.order(:id)
    @ranks = Rank.all.order(:level)
    @users = User.all.order(:email)
    render 'index'
  end

  def registers

  end

  def reports

  end
end
