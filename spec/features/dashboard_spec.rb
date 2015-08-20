require 'spec_helper'

feature "visit dashboard", %Q{
  As a user
  I want to view my dashboard
  So I can see what tasks are available to me
} do

  scenario "visits root path" do
    let!(:user) { create(:user) }

    context "guest" do
      visit root_path

      expect(page).to have_content("Log in")
      expect(page).to have_content("Register")
      expect(page).not_to have_content("Welcome")
    end

    context "registered user" do
      visit root_path
      log_in user

      expect(page).to have_content("Welcome")
      expect(page).to have_content("Log out")
    end
  end

  scenario "visits dashboard" do
    let!(:user) { create(:user) }

    context "guest" do
      visit dashboard_path(user)

      expect(page).to have_content("Please log in or register")
      expect(page).not_to have_content("Welcome")
    end

    context "registered user" do

      context "does not have listings" do
        visit dashboard_path(user)

        expect(page).not_to have_content("Active Listings")
        expect(page).to have_content("You don't have any listings yet.")
        expect(page).to have_link("Get started")
      end

      context "has listings" do

        it "shows number of active listings" do
          listings = create_list(:listings, 3, :active, user: user)

          visit dashboard_path(user)

          expect(page).to have_content("You have 3 active listings")
        end

        it "shows number of inactive listings" do
          listings = create_list(:listings, 3, :inactive, user: user)

          visit dashboard_path(user)

          expect(page).to have_content("You have 3 inactive listings")
        end

        it "shows number of sold listings" do
          listings = create_list(:listings, 1, :sold, user: user)

          visit dashboard_path(user)

          expect(page).to have_content("You've sold 1 property")
        end
      end

      context "has inactive or sold but no current listings" do
        listings = create_list(:listings, 3, :inactive, user: user)

        visit dashboard_path(user)

        expect(page).to have_content("You have no active listings.")
        expect(page).not_to have_content("You don't have any listings yet.")
        expect(page).to have_content("Here are some things you can do to attract more clients")
      end

      #################
      ## ADVERTISING ##
      #################

      context "does not have a Facebook page connected" do
        visit dashboard_path(user)

        expect(page).not_to have_link("Facebook")
        expect(page).to have_content("Add a Facebook business page")
      end

      context "has a Facebook page connected" do
        facebook_page = create(:facebook_page, user: user)

        visit dashboard_path(user)

        expect(page).not_to have_content("Add a Facebook business page")
        expect(page).to have_link(user.facebook_page.name)
      end

      context "does not have a Twitter account connected" do
        visit dashboard_path(user)

        expect(page).not_to have_link("Twitter")
        expect(page).to have_content("Add a Twitter account")
      end

      context "has a Twitter account connected" do
        twitter_account = create(:twitter_account, user: user)

        visit dashboard_path(user)

        expect(page).not_to have_content("Add a Twitter account")
        expect(page).to have_link(user.twitter_account.name)
      end

      context "does not have an Instagram account connected" do
        visit dashboard_path(user)

        expect(page).not_to have_link("Instagram")
        expect(page).to have_content("Add an Instagram account")
      end

      context "has an Instagram account connected" do
        instagram_account = create(:instagram_account, user: user)

        visit dashboard_path(user)

        expect(page).not_to have_content("Add an Instagram account")
        expect(page).to have_link(user.instagram_account.name)
      end

    end
  end

end
