describe FacebookAccount do
  let(:facebook_account) { create(:facebook_account) }

  it "has an identity" do
    expect(facebook_account.identity).not_to eq(nil)
  end

  it "has a uid" do
    expect(facebook_account.uid).to eq("123")
  end

  it "has a token" do
    expect(facebook_account.token).to eq("xyz")
  end

end
