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

        expect(page).to have_content("Authorize Facebook")
      end
    end

    context "has a Facebook account connected" do

      scenario "visit mixfeed" do
        identity = create(:identity, :facebook, user: user)
        create(:facebook_account, identity: identity)
        visit mixfeed_path(user.mixfeed)

        expect(page).not_to have_content("Authorize Facebook")
      end

      context "does not have a Twitter account connected" do
        scenario "visit mixfeed" do
          visit mixfeed_path(user.mixfeed)

          expect(page).to have_content("Authorize Twitter")
        end
      end

      context "has a Twitter account connected" do
        scenario "visits mixfeed" do
          identity = create(:identity, :twitter, user: user)
          create(:twitter_account, identity: identity)
          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_content("Authorize Twitter")
        end
      end

      context "does not have an Instagram account connected" do
        scenario "visits mixfeed" do
          visit mixfeed_path(user.mixfeed)

          expect(page).to have_content("Authorize Instagram")
        end
      end

      context "has an Instagram account connected" do
        scenario "visits mixfeed" do
          identity = create(:identity, :instagram, user: user)
          create(:instagram_account, identity: identity)

          visit mixfeed_path(user.mixfeed)

          expect(page).not_to have_content("Authorize Instagram")
        end
      end

    end
  end
end
