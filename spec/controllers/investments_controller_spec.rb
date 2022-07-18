require 'rails_helper'

RSpec.describe InvestmentsController, type: :controller do
  describe 'Post #create' do
    let(:campaign) { FactoryBot.create(:campaign)}

    context 'with valid attributes' do
      it 'should  save the new investment and update campaign in the database' do
        expect(Investment.count).to eq(0)
        expect(campaign.percentage_raised).to eq(0.0)

        post :create, params: { investment: { investor: 'AA', amount: 1000 }, campaign_id: campaign.id, }
        expect(Investment.count).to eq(1)
        expect(campaign.reload.percentage_raised).to eq(0.1)
      end
    end

    context 'when invalid investor' do
      let(:campaign) { FactoryBot.create(:campaign)}

      it 'should return the error message' do
        post :create, params: { investment: { investor: '', amount: 1000 }, campaign_id: campaign.id, }
        expect(JSON.parse(response.body)).to eq("errors" => {"investor"=>["can't be blank"]})
      end
    end

    context 'when invalid amount' do
      let(:campaign) { FactoryBot.create(:campaign)}

      it 'should return the error message' do
        post :create, params: { investment: { investor: 'AB', amount: 29 }, campaign_id: campaign.id, }
        expect(JSON.parse(response.body)).to eq("errors" => {"amount"=>["Must be a multiple of 5.0"]})
      end
    end

    context 'when inactive campaign' do
      let(:campaign) { FactoryBot.create(:campaign, active: false)}

      it 'should return the error message' do
        post :create, params: { investment: { investor: 'AB', amount: 100 }, campaign_id: campaign.id, }
        expect(JSON.parse(response.body)).to eq("errors" => {"active"=>["Please invest in an active campaign"]})
      end
    end
  end
end