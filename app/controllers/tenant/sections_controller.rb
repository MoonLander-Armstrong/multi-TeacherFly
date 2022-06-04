# frozen_string_literal: true

class Tenant::SectionsController < Tenant::BaseController
  layout "section"

  def show
    # authorize @course, policy_class: OrdersectionPolicy 

    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
    @rate = Read.read_finished_rate(current_user, params[:course_id])
  end
end
