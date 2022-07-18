FactoryBot.define do
  factory :campaign do |f|
    f.name { 'Something' }
    f.image_url { 'test-url' }
    f.percentage_raised {0.0}
    f.target_amount {10000}
    f.sector {0}
    f.country_code { 'BD' }
    f.investment_multiple {5.0}
  end

  factory :investment do |f|
    f.investor { 'Someone' }
    f.amount {50}
    campaign
  end
end