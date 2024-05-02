class ReceiptsController < BaseController
  def show
    @payment = current_user.sent_payments.find(params[:id])
    template = Template.find_by(kind: "receipt")

    if template
      render inline: render_liquid(template.html, payment: @payment, sender: current_user, recipient: @payment.recipient).html_safe
    else
      render plain: "No template found", status: :not_found
    end
  end

  private

  def render_liquid(template, payment:, sender:, recipient:)
    Liquid::Template.parse(template).render(
      'payment' => PaymentDrop.new(payment),
      'sender' => UserDrop.new(sender),
      'recipient' => UserDrop.new(recipient)
    )
  end
end
