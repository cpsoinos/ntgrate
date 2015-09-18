feature "twitter share" do

  let(:twitter_account) { create(:twitter_account) }
  let(:user) { twitter_account.identity.user }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  scenario "user clicks 'photo share'", js: true do
    visit dashboard_path(user.dashboard)
    find("#tw-photo-option").trigger("click")

    expect(page).to have_field("twitter_share[photo]")
    expect(page).to have_field("twitter_share[remote_photo_url]")
    expect(page).to have_field("twitter_share[content]")
  end

  scenario "user clicks 'video share'", js: true do
    pending("twitter video support")
    visit dashboard_path(user.dashboard)
    find("#tw-video-option").trigger("click")

    expect(page).to have_field("twitter_share[video]")
    expect(page).to have_field("twitter_share[content]")
  end

  scenario "user clicks 'text share' after selecting a different type", js: true do
    visit dashboard_path(user.dashboard)
    find("#tw-photo-option").trigger("click")

    expect(page).to have_field("twitter_share[photo]")

    find("#tw-text-option").trigger("click")
    expect(page).not_to have_field("twitter_share[photo]")
    expect(page).to have_field("twitter_share[content]")
  end

end
