describe FacebookAccount do
  let(:facebook_account) { create(:facebook_account) }

  it "has an identity" do
    expect(facebook_account.identity.provider).to eq("facebook")
  end

  it "has a uid" do
    expect(facebook_account.uid).to eq("123")
  end

  it "has a token" do
    expect(facebook_account.token).to eq("xyz")
  end

  it "can have facebook_pages" do
    create_list(:facebook_page, 4, facebook_account: facebook_account)

    expect(facebook_account.facebook_pages.count).to eq(4)
  end

end
