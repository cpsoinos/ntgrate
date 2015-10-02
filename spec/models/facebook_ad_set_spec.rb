describe FacebookAdSet do
  let(:facebook_ad_set) { create(:facebook_ad_set) }

  it "monetizes bid amount" do
    is_expected.to monetize(:bid_amount).allow_nil
  end

  it "monetizes lifetime budget" do
    is_expected.to monetize(:lifetime_budget)
  end

  it "monetizes daily budget" do
    is_expected.to monetize(:daily_budget)
  end

end
