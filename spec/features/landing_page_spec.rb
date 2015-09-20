feature "landing_page" do

  context "guest" do

    scenario "visits root path" do
      visit root_path

      expect(page).to have_content("Sign in")
      expect(page).to have_content("Sign in with Facebook")
      expect(page).not_to have_content("Sign in with Twitter")
      expect(page).to have_content("Sign up")
      expect(page).not_to have_content("Welcome")
      expect(page).to have_content("Attract more clients.")
      expect(page).to have_content("Promote your brand.")
      expect(page).to have_content("Why wait?")
      expect(page).to have_link("Get started")
      expect(page).to have_content("Create and share content on these channels.")
      expect(page).to have_content("Don't just reach your followers. Grow your audience.")
    end
  end

end
