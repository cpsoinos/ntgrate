describe TwitterFeedRetriever do

  let(:twitter_account) { create(:twitter_account, :test) }
  let(:retriever) { TwitterFeedRetriever.new(twitter_account, 10)}

  it "retrieves the user's recent tweets", :vcr, record: :new_episodes do
    response = retriever.get_feed
    expect(response.length).to eq(10)
    expect(response.first.user.screen_name).to eq("corey_test")
    expect(response.last.user.screen_name).to eq("corey_test")
  end

  it "retrieves the user's home feed", :vcr, record: :new_episodes do
    response = retriever.get_home_feed
    expect(response.length).to eq(10)
    expect(response.first.user.screen_name).not_to eq("corey_test")
    expect(response.last.user.screen_name).not_to eq("corey_test")
  end

  it "follows a user", :vcr, record: :new_episodes do
    response = retriever.follow("Apple")
    expect(response.first.id).to eq(380749300)
  end

  it "unfollows a user", :vcr, record: :new_episodes do
    response = retriever.unfollow("Apple")
    expect(response.first.id).to eq(380749300)
  end

  it "fetches a user", :vcr, record: :new_episodes do
    response = retriever.fetch_user("Apple")
    expect(response.id).to eq(380749300)
  end

  it "retrieves followers", :vcr, record: :new_episodes do
    response = retriever.followers
    expect(response).to be_instance_of(Twitter::Cursor)
  end

  it "retrieves a user's followers", :vcr, record: :new_episodes do
    response = retriever.find_followers("CoreyPsoinos")
    expect(response).to be_instance_of(Twitter::Cursor)
  end

  it "retrieves a user's timeline", :vcr, record: :new_episodes do
    response = retriever.find_timeline("CoreyPsoinos")
    expect(response.first.user.screen_name).to eq("CoreyPsoinos")
    expect(response.last.user.screen_name).to eq("CoreyPsoinos")
  end

  it "retrieves mentions", :vcr, record: :new_episodes do
    response = retriever.mentions
    expect(response.any? { |r| r.id == 655581651439874048 }).to be(true)
    expect(response.first.user_mentions.first.screen_name).to eq("corey_test")
  end

  it "retrieves a specific tweet", :vcr, record: :new_episodes do
    response = retriever.fetch_tweet(655059941028438017)
    expect(response.user.screen_name).to eq("Promoboxx")
  end

end
