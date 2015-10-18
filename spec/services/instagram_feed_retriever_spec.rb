describe InstagramFeedRetriever do

  let(:instagram_account) { create(:instagram_account, :test) }
  let(:retriever) { InstagramFeedRetriever.new(instagram_account, 10) }

  it "retrieves user's recent posts", :vcr, record: :new_episodes do
    response = retriever.get_feed
    expect(response.first.user.username).to eq("testacctntgrate")
  end

  it "retrieves user's home feed", :vcr, record: :new_episodes do
    response = retriever.get_home_feed
    expect(response.length).to eq(20)
    expect(response.first.user.username).not_to eq("testacctntgrate")
  end

end
