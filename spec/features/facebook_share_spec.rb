feature "facebook share" do

  let(:facebook_page) { create(:facebook_page) }
  let(:user) { facebook_page.facebook_account.identity.user }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  scenario "user clicks 'link share'", :js do
    visit dashboard_path(user.dashboard)
    find("#fb-link-option").trigger("click")

    expect(page).to have_field("facebook_share[link]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'photo share'", :js do
    visit dashboard_path(user.dashboard)
    find("#fb-photo-option").trigger("click")

    expect(page).to have_field("facebook_share[photo]")
    expect(page).to have_field("facebook_share[remote_photo_url]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'video share'", :js do
    visit dashboard_path(user.dashboard)
    find("#fb-video-option").trigger("click")

    expect(page).to have_field("facebook_share[video]")
    expect(page).to have_field("facebook_share[content]")
  end

  scenario "user clicks 'text share' after selecting a different type", :js do
    visit dashboard_path(user.dashboard)
    find("#fb-link-option").trigger("click")

    expect(page).to have_field("facebook_share[link]")

    find("#fb-text-option").trigger("click")
    expect(page).not_to have_field("facebook_share[link]")
    expect(page).to have_field("facebook_share[content]")
  end

  describe "validation" do

    context "photo-share" do

      scenario "user tries to upload file with incorrect extension", :js do
        visit dashboard_path(user.dashboard)
        find("#fb-photo-option").trigger("click")
        attach_file("Photo", "spec/fixtures/video.mov")

        expect(page).to have_content("Only image files with extension: .jpg, .jpeg, .gif or .png are allowed.")
      end

      scenario "user tries to upload valid file", :js do
        visit dashboard_path(user.dashboard)
        find("#fb-photo-option").trigger("click")
        attach_file("Photo", "spec/fixtures/test.png")

        expect(find_field("Photo").value).to have_content("test.png")
      end

    end

    context "video-share" do

      scenario "user tries to upload file with incorrect extension", :js do
        visit dashboard_path(user.dashboard)
        find("#fb-video-option").trigger("click")
        attach_file("Video", "spec/fixtures/test.png")

        expect(page).to have_content("Only video files with extension: .3g2, .3gp, .3gpp, .asf, .avi, .dat, .divx, .dv, .f4v, .flv, .m2ts, .m4v, .mkv, .mod, .mov, .mp4, .mpe, .mpeg, .mpeg4, .mpg , .mts, .nsv, .ogm, .ogv, .qt, .tod, .ts, .vob, or .wm are allowed.")
      end

      scenario "user tries to upload valid file", :js do
        visit dashboard_path(user.dashboard)
        find("#fb-video-option").trigger("click")
        attach_file("Video", "spec/fixtures/video.mov")

        expect(find_field("Video").value).to have_content("video.mov")
      end

    end
  end

end
