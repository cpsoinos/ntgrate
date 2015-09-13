feature "omniauthable" do

  before(:each) do
     mock_auth_hash
  end

  scenario "logs in with Facebook" do
    sign_in_with_facebook
    expect(page).to have_content("Successfully authenticated from Facebook account")
    expect(page).to have_content("Dashboard")
  end

end
