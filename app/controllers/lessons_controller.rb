class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_in_course
  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def enrolled_in_course
    if !current_user.enrolled_in? current_lesson.section.course
      redirect_to courses_path
      flash[:alert] = "Please Enroll in that Course"
    end
  end





end
