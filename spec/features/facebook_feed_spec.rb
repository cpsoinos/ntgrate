feature "facebook feed" do

  let(:facebook_page) { create(:facebook_page) }
  let(:user) { facebook_page.facebook_account.identity.user }
  let(:facebook_shares) { create_list(:facebook_share, 6, facebook_page: facebook_page) }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  it "shows the 5 most recent posts", js: true do
    visit dashboard_path(user.dashboard)
    find("#fb-newsfeed-button").trigger("click")

    expect(page).to have_content("Shared at:")
    expect(page).to have_content("by #{user.full_name}")
  end

end
