class Payment < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'

  validates :amount, numericality: { greater_than: 0 }
  validate :sufficient_funds

  private

  def sufficient_funds
    errors.add(:sender_id, 'insufficient balance') if sender.balance < amount
  end
end
