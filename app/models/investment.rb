class Investment < ApplicationRecord
  belongs_to :campaign, optional: true

  validates :amount, :investor, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :investment_multiple_with_amount
  validate :active_campaign

  def investment_multiple_with_amount
    investment_multiple = campaign.investment_multiple
    is_multiple = (amount % investment_multiple) == 0
    errors.add(:amount, "Must be a multiple of #{investment_multiple}") unless is_multiple
  end

  def active_campaign
    errors.add(:active, "Please invest in an active campaign") unless campaign.active
  end
end