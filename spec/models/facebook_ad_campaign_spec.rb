describe FacebookAdCampaign do
  let(:facebook_ad_campaign) { create(:facebook_ad_campaign) }

  it "monetizes spend cap" do
    is_expected.to monetize(:spend_cap)
  end
end
