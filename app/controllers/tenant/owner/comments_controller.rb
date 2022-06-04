class Tenant::Owner::CommentsController < Tenant::BaseController
  layout "owner"

  def index
    @courses = current_user.courses

    if params[:course].nil? || params[:course] == "0" 
      @courses
    else 
      @course_option = params[:course]
      @courses = @courses.find(params[:course]) 
    end
  end

  def create
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @comment = @section.comments.new(comment_params)
    if @comment.save
      redirect_to owner_comments_path, notice: "新增留言成功!"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to owner_comments_path, notice: "刪除留言成功"
    else
      redirect_to owner_comments_path, alter: "請再次確認"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(user: current_user, course: @course)
  end
end
