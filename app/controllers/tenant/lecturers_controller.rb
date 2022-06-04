class Tenant::LecturersController < Tenant::BaseController
  def show
    @lecturers = Lecturer.all
    @lecturer = Lecturer.find(params[:id])
  end
end
