feature "facebook share" do

  let(:facebook_page) { create(:facebook_page) }
  let(:user) { facebook_page.facebook_account.identity.user }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  scenario "user clicks 'link share'", js: true do
    visit dashboard_path(user.dashboard)
    find("#fb-link-option").trigger("click")

    expect(page).to have_field("facebook_share[link]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'photo share'", js: true do
    visit dashboard_path(user.dashboard)
    find("#fb-photo-option").trigger("click")

    expect(page).to have_field("facebook_share[photo]")
    expect(page).to have_field("facebook_share[remote_photo_url]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'video share'", js: true do
    visit dashboard_path(user.dashboard)
    find("#fb-video-option").trigger("click")

    expect(page).to have_field("facebook_share[video]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'text share' after selecting a different type", js: true do
    visit dashboard_path(user.dashboard)
    find("#fb-link-option").trigger("click")

    expect(page).to have_field("facebook_share[link]")

    find("#fb-text-option").trigger("click")
    expect(page).not_to have_field("facebook_share[link]")
    expect(page).to have_field("facebook_share[content]")
  end

end
