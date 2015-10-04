feature "mixfeed:" do

  let(:user) { create(:confirmed_user) }

  context "guest" do

    scenario "visits mixfeed" do
      visit mixfeed_path(user.mixfeed)

      expect(page).to have_content("Sign in")
      expect(page).to have_content("You need to sign in or sign up before continuing.")
      expect(page).not_to have_content("Mixfeed")
    end
  end

  context "registered user" do
    before :each do
      sign_in(user)
    end

    scenario "visits mixfeed" do
      visit mixfeed_path(user.mixfeed)

      expect(page).to have_content("Mixfeed")
      expect(page).to have_content("Sign out")
    end

    context "does not have a Facebook account connected" do
      scenario "visit mixfeed" do
        visit mixfeed_path(user.mixfeed)

        expect(page).not_to have_link("Share on Facebook")
        expect(page).to have_content("Connect your Facebook account")
      end
    end

    context "has a Facebook account connected" do

      scenario "visit mixfeed" do
        identity = create(:identity, :facebook, user: user)
        create(:facebook_account, identity: identity)
        visit mixfeed_path(user.mixfeed)

        expect(page).to have_content("Facebook Feed")
      end

      context "does not have a Twitter account connected" do
        scenario "visit mixfeed" do
          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_button("Tweet")
          expect(page).to have_content("Connect your Twitter account")
        end
      end

      context "has a Twitter account connected" do
        scenario "visits mixfeed" do
          identity = create(:identity, :twitter, user: user)
          create(:twitter_account, identity: identity)
          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_content("Connect your Twitter account")
          expect(page).to have_content("Twitter Feed")
        end
      end

      context "does not have an Instagram account connected" do
        scenario "visits mixfeed" do
          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_link("Post to Instagram")
          expect(page).to have_content("Connect your Instagram account")
        end
      end

      context "has an Instagram account connected" do
        scenario "visits mixfeed" do
          identity = create(:identity, :instagram, user: user)
          create(:instagram_account, identity: identity)

          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_content("Connect your Instagram account")
          expect(page).to have_content("Instagram Feed")
        end
      end

    end
  end
end
