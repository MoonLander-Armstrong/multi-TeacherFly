class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:payment_response, :payment]
  skip_before_action :verify_authenticity_token, only: %i[payment_response] #忽略外部網址 CSRF

  def index
    @orders = current_user.orders.where(status: "paid").includes(:course)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @course = @order.course
    @chapters = @course.chapters
    @rate = Read.read_finished_rate(current_user, @course.friendly_id)
    render layout: "section"
  end

  def payment_response
    trade_info = Newebpay::MpgResponse.new(params[:TradeInfo])
    if trade_info.status == "SUCCESS"
      Order.find(trade_info.order_no).pay!
      redirect_to orders_path
    else
      redirect_to courses_path, alert: "購買失敗，請確認有正確填寫付款資訊"
    end
  end

  def payment
    if current_user
      @course = Course.find(params[:course_id])
      order = @course.orders.new(name: @course.title, price: @course.price, user: current_user, email: current_user.email)

      if order.save
        @form_info = Newebpay::Mpg.new(order).form_info
      else
        render file: "#{Rails.root}/public/500.html"
      end
    else
      redirect_to new_user_session_path, alert: "請先進行登入"
    end
  end
end
