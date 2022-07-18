class InvestmentsController < ApplicationController
  def create
    @campaign = Campaign.find(params['campaign_id'])
    @investment = @campaign.investments.new(investment_params)
    if @investment.save
      percentage_raised = (@campaign.total_invested_amount/@campaign.target_amount)
      @campaign.update!(percentage_raised: percentage_raised)
      render json: { errors: nil, investment: @investment }
    else
      render json: { errors: @investment.errors.messages }, status: :unprocessable_entity
    end
  end

  def investment_params
    params.require(:investment).permit(:campaign_id, :investor, :amount)
  end
end
