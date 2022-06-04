class CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @comment = @section.comments.new(comment_params)
    render "sections/show" unless @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(user: current_user, course: @course)
  end
end
