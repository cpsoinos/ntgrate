describe FacebookPage do
  let(:facebook_page) { create(:facebook_page) }

  it "belongs to a facebook account" do
    expect(facebook_page.facebook_account.uid).to eq("123")
  end

  it "has a name" do
    expect(facebook_page.name).not_to eq(nil)
  end

  it "has a token" do
    expect(facebook_page.token).not_to eq(nil)
  end

  it "has a uid" do
    expect(facebook_page.uid).not_to eq(nil)
  end

end
