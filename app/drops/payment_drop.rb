class PaymentDrop < Liquid::Drop
  def initialize(payment)
    @payment = payment
  end

  def id
    @payment.id
  end

  def amount
    @payment.amount
  end

  def created_at
    @payment.created_at.strftime("%Y-%m-%d %H:%M")
  end
end