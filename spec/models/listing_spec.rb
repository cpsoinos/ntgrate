describe Listing do
  let(:active_listing) { create(:listing, :active) }
  let(:inactive_listing) { create(:listing, :inactive) }
  let(:sold_listing) { create(:listing, :sold) }

  it "has a user" do
    expect(active_listing.user).not_to eq(nil)
  end

  it "has a status" do
    expect(active_listing.status).to eq("active")
    expect(inactive_listing.status).to eq("inactive")
    expect(sold_listing.status).to eq("sold")
  end
end
