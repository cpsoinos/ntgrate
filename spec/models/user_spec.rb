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

  it "validates full name" do
    expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
  end
end

describe "#email_verified?" do
  let!(:user) { create(:user) }

  it "returns true when verified" do
    expect(user.email_verified?).to be(true)
  end

  it "returns false when unverified" do
    user.update_attribute("email", "change@me.facebook.com")

    expect(user.email_verified?).to be(false)
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

describe "#facebook_pages" do
  let(:facebook_page) { create(:facebook_page) }
  let(:user) { facebook_page.facebook_account.identity.user }
  let(:user2) { create(:user) }

  it "returns nil when no Facebook account" do
    expect(user2.facebook_pages).to eq(nil)
  end

  it "returns an empty array when Facebook account present but has no pages" do
    facebook_account = create(:facebook_account)
    user3 = facebook_account.identity.user

    expect(user3.facebook_pages).to eq([])
  end

  it "returns Facebook pages when present" do
    expect(user.facebook_pages.count).to be(1)
  end

  it "can have more than one Facebook page" do
    create(:facebook_page, facebook_account: user.facebook_account)

    expect(user.facebook_pages.count).to be(2)
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

describe "#linkedin_account" do
  let(:user) { create(:user) }

  it "returns nil when no LinkedIn account" do
    expect(user.linkedin_account).to eq(nil)
  end

  it "returns LinkedIn account when connected" do
    pending("LinkedIn")
    identity = create(:identity, :linkedin, user: user)
    linkedin_account = create(:linkedin_account, identity: identity)

    expect(user.linkedin_account).to eq(linkedin_account)
  end

end
