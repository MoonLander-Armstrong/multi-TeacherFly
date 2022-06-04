# frozen_string_literal: true

class Tenant::SectionsController < Tenant::BaseController
  layout "section"

  def show
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
    @rate = Read.read_finished_rate(current_student, @course.friendly_id)
  end
end
