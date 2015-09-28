feature "Facebook ads" do

  let(:user) { create_from_omniauth }

  before (:each) do
    user.confirm
    sign_in(user)
  end

  describe "create an ad campaign" do

    scenario "user wants to create an ad campaign", :vcr, record: :new_episodes do
      visit facebook_account_path(user.facebook_account)

      expect(page).to have_link("Create an ad campaign")
    end

    scenario "user clicks 'Create an ad campaign'", :vcr, record: :new_episodes do
      visit facebook_account_path(user.facebook_account)
      click_link("Create an ad campaign")

      expect(page).to have_content("Step 1")
      expect(page).to have_field("Name")
      expect(page).to have_content("Choose an objective")
      expect(page).to have_content("Page likes")
      expect(page).to have_content("Page post engagements")
      expect(page).to have_content("Clicks to website")
      expect(page).to have_content("Website conversions")
      expect(page).to have_field("Start time")
      expect(page).to have_field("Stop time")
      expect(page).to have_field("Spend cap")
    end

    scenario "user fills in valid info for Step 1", :vcr, record: :new_episodes do
      visit new_facebook_ad_campaign_path

      fill_in("Name", with: "My Campaign")
      choose("Clicks to website")
      fill_in("Start time", with: DateTime.now)
      fill_in("Stop time", with: (DateTime.now + 10))
      click_button("Continue")
      
      expect(page).to have_content("Step 2")
    end

    scenario "user fills in valid info for Step 2", :vcr, record: :new_episodes do
      visit new_facebook_ad_set_path

      expect(page).to have_field("Lifetime Budget")
      expect(page).to have_field("Daily Budget")

      fill_in("Lifetime Budget", with: "20")
      fill_in("Daily Budget", with: "5")
      click_button("Step 3")

      expect(page).to have_content("Confirm details")
    end

  end


end
