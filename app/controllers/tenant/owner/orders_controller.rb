class Tenant::Owner::OrdersController < Tenant::BaseController
  layout "owner"

  def index
    authorize :order
    @courses = Course.all
    @orders = Order.includes(:student).where(course: @courses).paid.order(id: :desc)

    if params[:days] && params[:days] != '0'
      @order_option = params[:days]
      @orders = @orders.time_select(params[:days])
    else
      @orders
    end
  end
end
