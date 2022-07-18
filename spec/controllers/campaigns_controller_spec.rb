require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe 'GET #index' do
    let!(:campaign) { FactoryBot.create(:campaign)}
    render_views

    context 'JSON format' do
      it 'should return an array of campaigns in the following format' do
        get :index, params: { format: :json }
        expect(JSON.parse(response.body)).to eq('campaigns' => [
            {
                "active"=>true,
                "country_code"=>"BD",
                "id"=> campaign.id,
                "image_url"=>"test-url",
                "investment_multiple"=>5.0,
                "name"=>"Something",
                "percentage_raised"=>0.0,
                "sector"=>"marketing_campaign",
                "target_amount"=>10000.0
            }])
      end
    end
  end
end