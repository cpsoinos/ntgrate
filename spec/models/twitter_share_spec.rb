describe TwitterShare do

  let(:twitter_share) { create(:twitter_share) }

  it "validates the presence of a twitter account" do
    expect(twitter_share.twitter_account).not_to eq(nil)
  end

end

describe TwitterShare, "#share" do
  it "shares to Twitter" do
    pending("testing with apis")
    twitter_share = create(:twitter_share)

    expect(twitter_share.share.response).to eq("success")
  end
end

describe TwitterShare, "#delete_share" do
  it "deletes a share from Twitter" do
    pending("testing with apis")
    twitter_share = create(:twitter_share)

    expect(twitter_share.delete_share.response).to eq("success")
  end
end

describe TwitterShare, "#get_share_type" do

  context "photo" do
    it "adds 'photo' to share_type for photo share" do
      pending("carrierwave testing")
      twitter_share = create(:twitter_share, :photo)
      twitter_share.get_share_type

      expect(twitter_share.share_type).to eq("photo")
    end
  end

  context "text" do
    it "adds 'text' to share_type for text share" do
      twitter_share = create(:twitter_share)
      twitter_share.get_share_type

      expect(twitter_share.share_type).to eq("text")
    end
  end
end

describe TwitterShare, "#get_share_url" do
  it "gets the Twitter url of a share" do
    pending("figuring out how to get the url of a share")
    twitter_share = create(:twitter_share)
    twitter_share.get_share_url

    expect(twitter_share.url).not_to eq(nil)
  end
end
