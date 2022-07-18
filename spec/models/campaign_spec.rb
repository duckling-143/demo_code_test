require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  describe 'Valid Attributes' do
    let(:valid_attributes) do
      {
        'name' => 'Something',
        'image_url' => 'test-url',
        'percentage_raised' => 0.50,
        'target_amount' => 10000,
        'sector' => 0,
        'country_code' => 'BD',
        'investment_multiple' => 5.3,
      }
    end

    it "saves successfully" do
      expect(Campaign.new(valid_attributes).save).to eq(true)
    end
  end

  describe 'Invalid Attributes' do
    let(:invalid_attributes) do
      {
        'name' => 'Something',
        'image_url' => 'test-url',
        'percentage_raised' => 0.50,
        'target_amount' => '',
        'sector' => 0,
        'country_code' => 'BD',
        'investment_multiple' => 5.3,
      }
    end

    it "raises validation error" do
      campaign = Campaign.new(invalid_attributes)
      expect(campaign.save).to eq(false)
      expect(campaign.errors.messages).to eq(:target_amount => ["can't be blank"])
    end
  end

  describe 'total invested amount' do
    let!(:campaign) { FactoryBot.create(:campaign)}
    let!(:investment_1) { FactoryBot.create(:investment, campaign: campaign)}
    let!(:investment_2) { FactoryBot.create(:investment, campaign: campaign)}


    it "return total amount invested" do
      expect(campaign.total_invested_amount).to eq(100.0)
    end
  end
end