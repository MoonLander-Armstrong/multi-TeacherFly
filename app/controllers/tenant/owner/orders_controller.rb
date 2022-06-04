class Tenant::Owner::OrdersController < Tenant::BaseController
  layout "owner"

  def index
    authorize :order
    @courses = current_user.courses
    @orders = Order.includes(:user).where(course: @courses).paid.order(id: :desc)    

    if params[:days]
      return @orders if params[:days] == '0'
      @order_option = params[:days]
      @orders = @orders.time_select(params[:days])
    else
      @orders
    end
  end
end
