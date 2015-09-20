describe User do

  before do
    mock_auth_hash
  end

  let(:user) { create_from_omniauth }

  it "creates a user if new registration", :vcr, record: :new_episodes do
    user
    expect(User.count).to be(1)
  end

  it "finds existing user if previously registered", :vcr, record: :new_episodes do
    user2 = create_from_omniauth

    expect(user).to eq(user2)
    expect(User.count).to be(1)
  end

  it "creates an identity if new registration", :vcr, record: :new_episodes do
    identity = user.identities.first

    expect(user.identities.count).to be(1)
    expect(identity.provider).to eq("facebook")
  end

  it "creates Facebook pages", :vcr, record: :new_episodes do
    facebook_page = user.facebook_pages.first

    expect(user.facebook_pages.count).to be(1)
    expect(facebook_page.name).to eq("Tester Realty")
  end

end
