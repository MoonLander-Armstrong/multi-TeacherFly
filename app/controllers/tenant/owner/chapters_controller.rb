# frozen_string_literal: true

class Tenant::Owner::ChaptersController < Tenant::BaseController
  layout "owner"
  before_action :find_chapter, only: %i[edit update destroy]
  before_action :find_course
  before_action :chapter_policy

  def new
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.new
  end

  def create
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.new(chapter_params)

    if @chapter.save
      redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
    else
      redirect_to curriculum_owner_course_path(@course)
      flash[:alert] = '請輸入正確資訊'
    end
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  def update
    @course = Course.find(params[:course_id])
    if @chapter.update(chapter_params)
      redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
    else
      flash.now[:alter] = '請輸入正確資訊'
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @chapter.destroy
    redirect_to curriculum_owner_course_path(@course), alert: '刪除成功'
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_policy
    authorize @course, policy_class: ChapterPolicy 
  end
end
