feature "facebook feed" do

  let(:user) { create_from_omniauth }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  describe "FacebookNewsFeed" do
    it "shows the 5 most recent posts", :js, :vcr, record: :new_episodes do
      pending("ajax load testing")
      visit dashboard_path(user.dashboard)
      find("#show-newsfeed").trigger("click")

      expect(page).to have_link("Tester Realty")
    end

    it "has a 'boost' button", :js, :vcr, record: :new_episodes do
      pending("ajax load testing")
      visit dashboard_path(user.dashboard)
      find("#show-newsfeed").trigger("click")

      expect(page).to have_button("Boost")
    end
  end

end
