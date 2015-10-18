describe MixfeedRetriever do

  let(:user) { create(:user) }
  let(:facebook_account) { create(:facebook_account, :test) }
  let(:twitter_account) { create(:twitter_account, :test) }
  let(:instagram_account) { create(:instagram_account, :test) }
  let(:limit) { 10 }
  let(:retriever) { MixfeedRetriever.new(user, limit) }

  describe "retrieves feeds" do

    it "retrieves facebook feed", :vcr, record: :new_episodes do
      facebook_account.identity.user = user
      facebook_account.identity.save

      expect(retriever.retrieve_feeds.length).to eq(10)
    end

    it "retrieves twitter feed", :vcr, record: :new_episodes do
      twitter_account.identity.user = user
      twitter_account.identity.save

      expect(retriever.retrieve_feeds.length).to eq(10)
    end

    it "retrieves instagram feed", :vcr, record: :new_episodes do
      instagram_account.identity.user = user
      instagram_account.identity.save

      expect(retriever.retrieve_feeds.length).to eq(20)
    end

  end

  describe "orders feeds" do

    it "parses Facebook share dates", :vcr, record: :new_episodes do
      facebook_account.identity.user = user
      facebook_account.identity.save

      expect(retriever.retrieve_feeds.first.class).to be(Hash)
    end

    it "parses Twitter share dates", :vcr, record: :new_episodes do
      twitter_account.identity.user = user
      twitter_account.identity.save

      expect(retriever.retrieve_feeds.first.class).to be(Twitter::Tweet)
    end

    it "parses Instagram share dates", :vcr, record: :new_episodes do
      instagram_account.identity.user = user
      instagram_account.identity.save

      expect(retriever.retrieve_feeds.first.class).to be(Hashie::Mash)
    end

    it "orders the shares", :vcr, record: :new_episodes do
      [facebook_account, twitter_account, instagram_account].each do |account|
        account.identity.user = user
        account.identity.save
      end

      feeds = retriever.order_feeds
      expect(retriever.parse_date(feeds.first)).to be > (retriever.parse_date(feeds.last))
    end

  end

end
