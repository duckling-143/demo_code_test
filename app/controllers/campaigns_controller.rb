class CampaignsController < ApplicationController
    def index
      @entities = Campaign.all
      @campaigns = Campaign.filter(@entities, params)
    end
  end
