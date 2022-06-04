class Tenant::Owner::UsersController < Tenant::BaseController
  layout "owner"
  before_action :find_user, only: [:information, :update, :subscription]

  def index
    authorize :user
    @users = current_user.students.ordered
  end

  def information
    authorize :user
  end

  def subscription
    @order = @user.orders.new(course_id: params[:course_id])
    if @order.save
      @order.pay!
      redirect_to information_owner_user_path(@user), notice: "新增訂閱課程"
    else
      redirect_to information_owner_user_path(@user), alert: "請確認資料"
    end
  end

  def update
    authorize :user
    if @user.update(user_params)
      redirect_to information_owner_user_path(@user), notice: "成功更新學生資料"
    else
      render :information, alert: "請輸入正確資訊"
    end
  end

  def create
    @user = current_user.students.new(user_params)
    if @user.save
      redirect_to owner_users_path, notice:  "成功新增學生資料"
    else
      redirect_to owner_users_path  
      flash.now[:notice] = "請重新輸入"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :password)
  end

  def find_user
    @user = current_user.students.find(params[:id])
  end
end
