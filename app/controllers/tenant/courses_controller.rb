# frozen_string_literal: true

class Tenant::CoursesController < Tenant::BaseController
  def index
    sign_in MultiTenantSupport.current_tenant
    @courses = Course.published.order(id: :desc)
    @lecturers = Lecturer.all
    @courses = @courses.search(params[:search]) if params[:search]
  end

  def show
    @course = Course.find(params[:id])
    @lecturer = @course.lecturer
    @order = current_student.orders.find_by(course_id: @course, status: "paid") if student_signed_in?
  end

  private

  def course_params
    params.require(:course).permit(:title, :content, :price, :published, :description, :image)
  end
end
