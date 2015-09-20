feature "twitter share" do

  let(:twitter_account) { create(:twitter_account) }
  let(:user) { twitter_account.identity.user }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  scenario "user clicks 'photo share'", :js do
    visit dashboard_path(user.dashboard)
    find("#tw-photo-option").trigger("click")

    expect(page).to have_field("twitter_share[photo]")
    expect(page).to have_field("twitter_share[remote_photo_url]")
    expect(page).to have_field("twitter_share[content]")
  end

  scenario "user clicks 'video share'", :js do
    pending("twitter video support")
    visit dashboard_path(user.dashboard)
    find("#tw-video-option").trigger("click")

    expect(page).to have_field("twitter_share[video]")
    expect(page).to have_field("twitter_share[content]")
  end

  scenario "user clicks 'text share' after selecting a different type", :js do
    visit dashboard_path(user.dashboard)
    find("#tw-photo-option").trigger("click")

    expect(page).to have_field("twitter_share[photo]")

    find("#tw-text-option").trigger("click")
    expect(page).not_to have_field("twitter_share[photo]")
    expect(page).to have_field("twitter_share[content]")
  end

  describe "validation" do

    context "photo-share" do

      scenario "user tries to upload file with incorrect extension", :js do
        visit dashboard_path(user.dashboard)
        find("#tw-photo-option").trigger("click")
        attach_file("Photo", "spec/fixtures/video.mov")

        expect(page).to have_content("Only image files with extension: .jpg, .jpeg, .gif or .png are allowed.")
      end

      scenario "user tries to upload valid file", :js do
        visit dashboard_path(user.dashboard)
        find("#tw-photo-option").trigger("click")
        attach_file("Photo", "spec/fixtures/test.png")

        expect(find_field("Photo").value).to have_content("test.png")
      end

    end
  end

end
