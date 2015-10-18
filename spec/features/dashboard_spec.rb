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
          create(:facebook_account, identity: identity)
          visit dashboard_path(user.dashboard)

          expect(page).to have_content("You do not have any Facebook pages.")
        end
      end

      context "has a Facebook page connected" do

        scenario "visit dashboard" do
          identity = create(:identity, :facebook, user: user)
          facebook_account = create(:facebook_account, identity: identity)
          create(:facebook_page, facebook_account: facebook_account)
          visit dashboard_path(user.dashboard)

          expect(page).to have_button("Share on Facebook")
        end
      end

    end

    context "does not have a Twitter account connected" do
      scenario "visit dashboard" do
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_button("Tweet")
        expect(page).to have_content("Connect your Twitter account")
      end
    end

    context "has a Twitter account connected" do
      scenario "visits dashboard" do
        identity = create(:identity, :twitter, user: user)
        create(:twitter_account, identity: identity)
        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Connect your Twitter account")
        expect(page).to have_button("Tweet")
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
        create(:instagram_account, identity: identity)

        visit dashboard_path(user.dashboard)

        expect(page).not_to have_content("Connect your Instagram account")
        expect(page).to have_link("Post to Instagram")
      end
    end
  end
end
