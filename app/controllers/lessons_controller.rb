class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, except: :new

  def show
  
  end

  private
  
  helper_method :current_lesson
  
  def verify_course_enrollment
  	current_user.enrolled_in?(current_course)
  	if !current_user.enrolled_in?(curent_course)
  		redirect_to current_course, alert: 'Please Enroll In The Course'
  end

  
  def current_course
  	current_lesson.section.course
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end