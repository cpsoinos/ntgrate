feature "facebook feed" do

  let(:user) { create_from_omniauth }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  describe "FacebookNewsFeed" do
    it "shows the 5 most recent posts", :js, :vcr, record: :new_episodes do
      visit dashboard_path(user.dashboard)
      find("#show-newsfeed").trigger("click")

      expect(page).to have_content("Tester Realty shared at:")
    end
  end

end
