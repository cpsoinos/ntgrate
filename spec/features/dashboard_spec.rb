feature "user dashboard:" do

  let(:user) { create(:user) }

  context "guest" do

    scenario "visits root path" do
      visit root_path

      expect(page).to have_content("Sign in")
      expect(page).to have_content("Sign up")
      expect(page).not_to have_content("Welcome")
      expect(page).to have_content("Please sign in or register")
    end

    scenario "visits dashboard" do
      visit dashboard_path(user.dashboard)

      expect(page).to have_content("Please sign in or register")
      expect(page).not_to have_content("Welcome")
    end
  end

  context "registered user" do
    scenario "visits root path" do
      sign_in user

      expect(page).to have_content("Welcome")
      expect(page).to have_content("Sign out")
    end

    context "does not have listings" do
      scenario "visits dashboard" do
        sign_in user
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Active Listings")
        expect(page).to have_content("You don't have any listings yet.")
        expect(page).to have_link("Get started")
      end
    end

    context "has listings" do
      it "shows number of active listings" do
        create_list(:listings, 3, :active, user: user)
        visit dashboard_path(user.dashboard)

        expect(page).to have_content("You have 3 active listings")
      end

      it "shows number of inactive listings" do
        create_list(:listings, 3, :inactive, user: user)
        visit dashboard_path(user.dashboard)

        expect(page).to have_content("You have 3 inactive listings")
      end

      it "shows number of sold listings" do
        listings = create_list(:listings, 1, :sold, user: user)
        visit dashboard_path(user.dashboard)

        expect(page).to have_content("You've sold 1 property")
      end
    end

    context "has inactive or sold but no current listings" do
      it "suggests ways to reach new prospective clients" do
        create_list(:listings, 3, :inactive, user: user)
        visit dashboard_path(user.dashboard)

        expect(page).to have_content("You have no active listings.")
        expect(page).not_to have_content("You don't have any listings yet.")
        expect(page).to have_content("Here are some things you can do to attract more clients")
      end
    end

    #################
    ## ADVERTISING ##
    #################

    context "does not have a Facebook page connected" do
      scenario "visit dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_link("Facebook")
        expect(page).to have_content("Add a Facebook business page")
      end
    end

    context "has a Facebook page connected" do
      scenario "visit dashboard" do
        facebook_page = create(:facebook_page, user: user)
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Add a Facebook business page")
        expect(page).to have_link(user.facebook_page.name)
      end
    end

    context "does not have a Twitter account connected" do
      scenario "visit dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_link("Twitter")
        expect(page).to have_content("Add a Twitter account")
      end
    end

    context "has a Twitter account connected" do
      scenario "visits dashboard" do
        twitter_account = create(:twitter_account, user: user)

        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Add a Twitter account")
        expect(page).to have_link(user.twitter_account.name)
      end
    end

    context "does not have an Instagram account connected" do
      scenario "visits dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_link("Instagram")
        expect(page).to have_content("Add an Instagram account")
      end
    end

    context "has an Instagram account connected" do
      scenario "visits dashboard" do
        instagram_account = create(:instagram_account, user: user)

        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Add an Instagram account")
        expect(page).to have_link(user.instagram_account.name)
      end
    end
  end
end
