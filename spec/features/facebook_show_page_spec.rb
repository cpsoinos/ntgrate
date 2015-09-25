feature "Facebook show:" do

  let(:facebook_page) { create(:facebook_page) }
  let(:user) { facebook_page.facebook_account.identity.user }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  scenario "from dashboard" do

    it "has links to Facebook details" do
      visit dashboard_path(user.dashboard)

      expect(page).to have_link("Facebook")
    end

    it "takes you to the Facebook details page" do
      visit dashboard_path(user.dashboard)
      click_link("Facebook Details")

      expect(page).to have_content("Facebook")
      expect(page).to have_content("Likes")
    end

  end

end
