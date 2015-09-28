class FacebookAdCampaignsController < ApplicationController

  def new
    @facebook_ad_campaign = FacebookAdCampaign.new
    @facebook_account = current_user.facebook_account
  end

  def create
    respond_to do |format|
      format.js do
        @facebook_ad_campaign = FacebookAdCampaign.new(facebook_ad_campaign_params)
        @facebook_ad_campaign.ad_account_id = ENV["FACEBOOK_AD_ACCOUNT_ID"]
        if @facebook_ad_campaign.save
          flash.now[:notice] = "Campaign saved!"
        end
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def facebook_ad_campaign_params
    params.require(:facebook_ad_campaign).permit([:name, :objective, :start_time, :stop_time, :spend_cap])
  end

end
