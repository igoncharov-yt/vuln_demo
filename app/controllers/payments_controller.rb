class PaymentsController < BaseController
  def index
    @payments = current_user.sent_payments.order(created_at: :desc)
    if params[:year].present?
      @payments = @payments.where("extract(year from created_at) = #{params[:year]}")
    end
  end

  def create
    @payment = current_user.sent_payments.new(payment_params)
    @recipient = User.find_by(id: payment_params[:recipient_id])

    if @recipient.nil?
      flash[:alert] = "Recipient not found"
      redirect_back(fallback_location: root_url)
    else
      Payment.transaction do
        if @payment.save
          current_user.update!(balance: current_user.balance - @payment.amount)
          @recipient.update!(balance: @recipient.balance + @payment.amount)
          flash[:notice] = "Payment successful"
          redirect_to profile_url(@recipient)
        else
          flash[:alert] = "Payment failed: " + @payment.errors.full_messages.join(", ")
          redirect_back(fallback_location: root_url)
        end
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:recipient_id, :comment, :amount)
  end
end
