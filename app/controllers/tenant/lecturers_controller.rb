class LecturersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @lecturers = Lecturer.all
    @lecturer = Lecturer.find(params[:id])
  end
end
