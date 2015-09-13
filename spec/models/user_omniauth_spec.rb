describe User do

  before do
    mock_auth_hash
  end

  let(:user) { create_from_omniauth }

  it "creates a user if new registration" do
    user
    expect(User.count).to be(1)
  end

  it "finds existing user if previously registered" do
    user2 = create_from_omniauth

    expect(user).to eq(user2)
    expect(User.count).to be(1)
  end

  it "creates an identity if new registration" do
    identity = user.identities.first

    expect(user.identities.count).to be(1)
    expect(identity.provider).to eq("facebook")
  end

  it "creates Facebook pages" do
    facebook_page = user.facebook_pages.first

    expect(user.facebook_pages.count).to be(1)
    expect(facebook_page.name).to eq("Tester Realty")
  end

end
