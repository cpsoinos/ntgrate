class FacebookAdSetsController < ApplicationController

  def new

  end

  def create
    respond_to do |format|
      format.js do
        @facebook_ad_campaign = FacebookAdCampaign.find(params[:facebook_ad_set][:facebook_ad_campaign_id].to_i)
        @facebook_ad_set = @facebook_ad_campaign.facebook_ad_sets.new(facebook_ad_set_params)
        @facebook_ad_set.ad_account_id = ENV["FACEBOOK_AD_ACCOUNT_ID"]
        if @facebook_ad_set.save
          flash.now[:notice] = "Ad set saved!"
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

  protected

  def facebook_ad_set_params
    params.require(:facebook_ad_set).permit([:facebook_ad_campaign_id, :lifetime_budget, :daily_budget])
  end

end
