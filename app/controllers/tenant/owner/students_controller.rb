class Tenant::Owner::StudentsController < Tenant::BaseController
  layout "owner"
  before_action :find_student, only: [:information, :update, :subscription]

  def index
    authorize :student
    @students = Student.all.order(id: :desc)
  end

  def information
    authorize :student
    @orders = @student.orders.paid
  end

  def subscription
    @teacher = current_teacher
    @order = @student.orders.new(course_id: params[:course_id])
    if @order.save
      @order.pay!
      GiveAwaySubscriptionJob.perform_later(@student, @teacher, @order)
      flash[:notice] = "新增訂閱課程"
    else
      flash[:alert] = "請確認資料"
    end
    redirect_to information_owner_student_path(@student)
  end

  def update
    authorize :student
    if @student.update(student_params)
      redirect_to information_owner_student_path(@student), notice: "成功更新學生資料"
    else
      render :information, alert: "請輸入正確資訊"
    end
  end

  def create
    @teacher = current_teacher
    @student = Student.new(student_params)
    if @student.save
      RegisteredMemberJob.perform_later(@student, @teacher)
      flash[:notice] = "成功新增學生資料"
    else
      flash[:alert] = "請重新輸入"
    end
    redirect_to owner_students_path
  end

  private

  def student_params
    params.require(:student).permit(:email, :username, :avatar, :password)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
