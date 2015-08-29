describe User do
  let(:user) { create(:user, email: "test1@test.com") }

  it "has an email address" do
    expect(user.email).to eq("test1@test.com")
  end

  it "has a password" do
    expect(user.encrypted_password).not_to eq(nil)
  end

  it "has a dashboard" do
    expect(user.dashboard).not_to eq(nil)
  end

  it "can have an identity" do
    create(:identity, :facebook, user: user)

    expect(user.identities.first.provider).to eq("facebook")
  end
end

describe "#facebook_account" do
  let(:user) { create(:user) }

  it "returns nil when no Facebook account" do
    expect(user.facebook_account).to eq(nil)
  end

  it "returns Facebook account when connected" do
    identity = create(:identity, :facebook, user: user)
    facebook_account = create(:facebook_account, identity: identity)

    expect(user.facebook_account).to eq(facebook_account)
  end
end

describe "#twitter_account" do
  let(:user) { create(:user) }

  it "returns nil when no Twitter account" do
    expect(user.twitter_account).to eq(nil)
  end

  it "returns Twitter account when connected" do
    identity = create(:identity, :twitter, user: user)
    twitter_account = create(:twitter_account, identity: identity)

    expect(user.twitter_account).to eq(twitter_account)
  end
end

describe "#instagram_account" do
  let(:user) { create(:user) }

  it "returns nil when no Instagram account" do
    expect(user.instagram_account).to eq(nil)
  end

  it "returns Instagram account when connected" do
    identity = create(:identity, :instagram, user: user)
    instagram_account = create(:instagram_account, identity: identity)

    expect(user.instagram_account).to eq(instagram_account)
  end
end
