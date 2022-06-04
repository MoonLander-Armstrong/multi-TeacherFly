class Tenant::Api::V1::SectionsController < Tenant::BaseController
  def finished
    read_section = current_student.reads.to_read_sections(params[:sectionId])

    if read_section.update(finished: params[:finished])
      render json: {
        message: "更新成功",
        progress: "#{Read.read_finished_rate(current_student, params[:course_id])}%",
        finished: read_section.pluck(:finished)
      }
    else
      render json: {
        message: "更新失敗",
        finished: read_section.pluck(:finished)
      }, status: 500
    end
  end
end
