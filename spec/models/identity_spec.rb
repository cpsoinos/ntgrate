describe Identity do
  let(:identity_fb) { create(:identity, :facebook) }
  let(:identity_tw) { create(:identity, :twitter) }

  it "has a user" do
    expect(identity_fb.user).not_to eq(nil)
    expect(identity_tw.user).not_to eq(nil)
  end

  it "has a uid" do
    expect(identity_fb.uid).to eq("123abc")
    expect(identity_tw.uid).to eq("123abc")
  end

  it "has a token" do
    expect(identity_fb.token).to eq("789xyz")
    expect(identity_tw.token).to eq("789xyz")
  end

  it "has a provider" do
    expect(identity_fb.provider).to eq("facebook")
    expect(identity_tw.provider).to eq("twitter")
  end
end
