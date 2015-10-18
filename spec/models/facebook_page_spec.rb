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

  describe "methods" do

    let(:facebook_account) { create(:facebook_account, :test) }

    before do
      facebook_account.create_facebook_pages
    end

    it "retrieves the page's recent posts", :vcr, record: :new_episodes do
      facebook_page = facebook_account.facebook_pages.first
      response = facebook_page.feed
      expect(response.length).to eq(5)
    end

  end

end
