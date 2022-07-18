class Campaign < ApplicationRecord
  has_many :investments
  scope :active, ->{ where(active: true) }

  enum sector: { marketing_campaign: 0, social_media_campaign: 1, advertising_campaign: 2 }

  validates :name,:percentage_raised, :target_amount, :sector, :country_code, :investment_multiple, presence: true

  def total_invested_amount
    investments.to_a.sum(&:amount)
  end

  def self.filter(entities, params)
    filter_param = params["filter_param"]
    case filter_param
    when 'active'
      entities.active
    when 'social_media_campaign'
      entities.social_media_campaign
    when 'marketing_campaign'
      entities.marketing_campaign
    when 'advertising_campaign'
      entities.advertising_campaign
    else
      entities
    end
  end
end