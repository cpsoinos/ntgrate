describe TwitterAccount do
  let(:twitter_account) { create(:twitter_account) }

  it "has an identity" do
    expect(twitter_account.identity.provider).to eq("twitter")
  end

  it "has a uid" do
    expect(twitter_account.uid).to eq("123")
  end

  it "has a token" do
    expect(twitter_account.token).to eq("xyz")
  end

  it "has a secret" do
    expect(twitter_account.secret).to eq("supersecret")
  end

  it "has a handle" do
    expect(twitter_account.handle).to eq("@PrincessPeach")
  end

end
