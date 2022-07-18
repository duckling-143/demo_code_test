json.campaigns @campaigns do |campaign|
  json.id campaign.id
  json.name campaign.name
  json.image_url campaign.image_url
  json.percentage_raised campaign.percentage_raised
  json.target_amount campaign.target_amount
  json.sector campaign.sector
  json.country_code campaign.country_code
  json.investment_multiple campaign.investment_multiple
  json.active campaign.active
end