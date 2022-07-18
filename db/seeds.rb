Campaign.destroy_all
20.times do
  Campaign.create!(
    name: Faker::Name.name,
    image_url: Faker::Internet.url,
    percentage_raised: Faker::Number.between(from: 0.0, to: 1.0),
    target_amount: Faker::Number.between(from: 1000, to: 10000),
    sector: Faker::Number.between(from: 0, to: 2),
    country_code: 'BD',
    investment_multiple: Faker::Number.between(from: 5, to: 50),
    active: true
    )
end

