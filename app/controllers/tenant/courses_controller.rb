# frozen_string_literal: true

class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = Course.published.order(id: :desc) 
    @lecturers = Lecturer.all
    @courses = @courses.search(params[:search]) if params[:search]
  end

  def show
    @course = Course.find(params[:id])
    @lecturer = @course.lecturer
    @order = current_user.orders.find_by(course_id: @course, status: "paid") if current_user
  end

  private

  def course_params
    params.require(:course).permit(:title, :content, :price, :published, :description,  :image)
  end
end
