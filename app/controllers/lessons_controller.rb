class LessonsController < ApplicationController
  before_filter :redirect_if_not_enrolled

  def show
  end

  private
  
  helper_method :current_lesson
  
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def user_enrolled_in_course?
  	current_user.enrolled_in?(current_course)
  end

  def redirect_if_not_enrolled
  	if !user_enrolled_in_course?
  		redirect_to(
  			current_course,
  			alert: "You need to enroll in the course in order to view lessons",
  		)
  	end
  end

  def current_course
  	current_lesson.section.course
  end
end