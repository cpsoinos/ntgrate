feature "landing_page" do

  context "guest" do

    scenario "visits root path" do
      visit root_path

      expect(page).to have_content("Sign in")
      expect(page).to have_content("Sign in with Facebook")
      expect(page).not_to have_content("Sign in with Twitter")
      expect(page).to have_content("Sign up")
      expect(page).not_to have_content("Welcome")
      expect(page).to have_content("See more content.")
      expect(page).to have_content("Get more likes.")
      expect(page).to have_content("Find more followers.")
      expect(page).to have_content("Build new connections.")
      expect(page).to have_content("Why split your time between different networks?")
      expect(page).to have_link("ntgrate them")
      expect(page).to have_content("Create and share content on these channels.")
      expect(page).to have_content("Don't just reach your followers. Grow your audience.")
    end
  end

end
