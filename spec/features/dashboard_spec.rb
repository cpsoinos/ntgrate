feature "user dashboard:" do

  let(:user) { create(:confirmed_user) }

  context "guest" do

    scenario "visits dashboard" do
      visit dashboard_path(user.dashboard)

      expect(page).to have_content("Sign in")
      expect(page).to have_content("You need to sign in or sign up before continuing.")
      expect(page).not_to have_content("Welcome")
    end
  end

  context "registered user" do
    before :each do
      sign_in(user)
    end

    scenario "visits root path" do
      visit root_path

      expect(page).to have_content("Welcome")
      expect(page).to have_content("Sign out")
    end

    ##################
    #### LISTINGS ####
    ##################

    # context "does not have listings" do
    #   scenario "visits dashboard" do
    #     visit dashboard_path(user.dashboard)
    #
    #     expect(page).not_to have_content("Active Listings")
    #     expect(page).to have_content("You don't have any listings yet.")
    #     expect(page).to have_link("Get started")
    #   end
    # end
    #
    # context "has listings" do
    #   it "shows number of active listings" do
    #     create_list(:listing, 3, :active, user: user)
    #     visit dashboard_path(user.dashboard)
    #
    #     expect(page).to have_content("You have 3 active listings")
    #   end
    #
    #   it "shows number of inactive listings" do
    #     create_list(:listing, 3, :inactive, user: user)
    #     visit dashboard_path(user.dashboard)
    #
    #     expect(page).to have_content("You have 3 inactive listings")
    #   end
    #
    #   it "shows number of sold listings" do
    #     listings = create_list(:listing, 1, :sold, user: user)
    #     visit dashboard_path(user.dashboard)
    #
    #     expect(page).to have_content("You've sold 1 property")
    #   end
    # end
    #
    # context "has inactive or sold but no current listings" do
    #   it "suggests ways to reach new prospective clients" do
    #     create_list(:listing, 3, :inactive, user: user)
    #     visit dashboard_path(user.dashboard)
    #
    #     expect(page).to have_content("You have no active listings.")
    #     expect(page).not_to have_content("You don't have any listings yet.")
    #     expect(page).to have_content("Here are some things you can do to attract more clients")
    #   end
    # end

    #################
    ## ADVERTISING ##
    #################

    context "does not have a Facebook account connected" do
      scenario "visit dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_link("Share on Facebook")
        expect(page).to have_content("Connect your Facebook account")
      end
    end

    context "has a Facebook account connected" do

      context "does not have any Facebook pages connected" do
        scenario "visit dashboard" do
          identity = create(:identity, :facebook, user: user)
          facebook_account = create(:facebook_account, identity: identity)
          visit dashboard_path(user.dashboard)

          expect(page).to have_content("You do not have any Facebook pages.")
        end
      end

      context "has a Facebook page connected" do

        scenario "visit dashboard" do
          identity = create(:identity, :facebook, user: user)
          facebook_account = create(:facebook_account, identity: identity)
          facebook_page = create(:facebook_page, facebook_account: facebook_account)
          visit dashboard_path(user.dashboard)

          expect(page).to have_button("Share on Facebook")
        end
      end

    end

    context "does not have a Twitter account connected" do
      scenario "visit dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_button("Post to Twitter")
        expect(page).to have_content("Connect your Twitter account")
      end
    end

    context "has a Twitter account connected" do
      scenario "visits dashboard" do
        identity = create(:identity, :twitter, user: user)
        twitter_account = create(:twitter_account, identity: identity)
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Connect your Twitter account")
        expect(page).to have_button("Post to Twitter")
      end
    end

    context "does not have an Instagram account connected" do
      scenario "visits dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_link("Post to Instagram")
        expect(page).to have_content("Connect your Instagram account")
      end
    end

    context "has an Instagram account connected" do
      scenario "visits dashboard" do
        identity = create(:identity, :instagram, user: user)
        instagram_account = create(:instagram_account, identity: identity)

        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Connect your Instagram account")
        expect(page).to have_link("Post to Instagram")
      end
    end
  end
end
