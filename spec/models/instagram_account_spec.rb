describe InstagramAccount do
  let(:instagram_account) { create(:instagram_account) }

  it "has an identity" do
    expect(instagram_account.identity.provider).to eq("instagram")
  end

  it "has a uid" do
    expect(instagram_account.uid).to eq("123")
  end

  it "has a token" do
    expect(instagram_account.token).to eq("xyz")
  end

end
