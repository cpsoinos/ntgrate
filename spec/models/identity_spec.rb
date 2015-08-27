describe Identity do
  let(:identity_fb) { create(:identity, :facebook) }
  let(:identity_tw) { create(:identity, :twitter) }
  let(:identity_ig) { create(:identity, :instagram) }

  it "has a user" do
    expect(identity_fb.user).not_to eq(nil)
    expect(identity_tw.user).not_to eq(nil)
    expect(identity_ig.user).not_to eq(nil)
  end

  it "has a uid" do
    expect(identity_fb.uid).to eq("123abc")
    expect(identity_tw.uid).to eq("123abc")
    expect(identity_ig.uid).to eq("123abc")
  end

  it "has a provider" do
    expect(identity_fb.provider).to eq("facebook")
    expect(identity_tw.provider).to eq("twitter")
    expect(identity_ig.provider).to eq("instagram")
  end
end
