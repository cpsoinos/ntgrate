describe Identity do
  let(:identity_fb) { create(:identity, :facebook, uid: "abc1") }
  let(:identity_tw) { create(:identity, :twitter, uid: "abc2") }
  let(:identity_ig) { create(:identity, :instagram, uid: "abc3") }

  it "has a user" do
    expect(identity_fb.user).not_to eq(nil)
    expect(identity_tw.user).not_to eq(nil)
    expect(identity_ig.user).not_to eq(nil)
  end

  it "has a uid" do
    expect(identity_fb.uid).to eq("abc1")
    expect(identity_tw.uid).to eq("abc2")
    expect(identity_ig.uid).to eq("abc3")
  end

  it "has a provider" do
    expect(identity_fb.provider).to eq("facebook")
    expect(identity_tw.provider).to eq("twitter")
    expect(identity_ig.provider).to eq("instagram")
  end
end

describe "scopes" do
  let(:identities_fb) { create_list(:identity, 5, :facebook) }
  let(:identities_tw) { create_list(:identity, 5, :twitter) }
  let(:identities_ig) { create_list(:identity, 5, :instagram) }

  it "returns only Facebook identities" do
    expect(Identity.facebook).to eq(identities_fb)
    expect(Identity.facebook.any? { |i| i.provider != "facebook" }).to eq(false)
  end

  it "returns only Twitter identities" do
    expect(Identity.twitter).to eq(identities_tw)
    expect(Identity.facebook.any? { |i| i.provider != "twitter" }).to eq(false)
  end

  it "returns only Instagram identities" do
    expect(Identity.instagram).to eq(identities_ig)
    expect(Identity.facebook.any? { |i| i.provider != "instagram" }).to eq(false)
  end
end

describe "#check_for_account(auth)" do
  before do
    mock_auth_hash
  end


  it "finds an existing Facebook account" do
    user = create_from_omniauth
    identity = user.identities.first
    facebook_account = user.facebook_account
    identity.check_for_account(mock_auth_hash)

    expect(identity.facebook_account).to eq(facebook_account)
  end

  it "creates a new Facebook account if not present" do
    expect(FacebookAccount.count).to be(0)
    create_from_omniauth

    expect(FacebookAccount.count).to be(1)
  end
end
