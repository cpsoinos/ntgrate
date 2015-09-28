class FacebookAdcampaignCreator

  def initialize(facebook_account)
    @facebook_account = facebook_account
  end

  def create_campaign
    opts = {
          :ad_account_id          => ENV["FACEBOOK_AD_ACCOUNT_ID"], # this is my business manager ad account id
          :campaign_group_status  => "PAUSED", # paused for testing
          :name                   => "test", # pull from facebook campaign model
          :objective              => "POST_ENGAGEMENT" # set campaign objective
        }

    response = graph.put_connections(ad_account_identifier, 'adgroups', opts)
    # add this to a facebook campaign model
  end

  private

  def graph
    @_graph = Koala::Facebook::API.new(@facebook_account.token)
  end

  def ad_account_identifier
    'act_' + ENV["FACEBOOK_AD_ACCOUNT_ID"]
  end
end
