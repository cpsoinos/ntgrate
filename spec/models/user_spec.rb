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
