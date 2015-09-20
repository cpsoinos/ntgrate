describe FacebookShare do

  let(:facebook_share) { create(:facebook_share) }

  it "validates the presence of a facebook page" do
    expect(facebook_share.facebook_page).not_to eq(nil)
  end

end

describe FacebookShare, "#share" do
  include ActiveJob::TestHelper

  let(:user) { create_from_omniauth }

  it "creates a FacebookShareJob", :vcr, record: :new_episodes do
    facebook_share = user.facebook_pages.first.facebook_shares.new(content: Faker::Lorem.paragraph)
    facebook_share.share

    expect(enqueued_jobs.size).to eq(1)
  end

  it "shares to Facebook", :vcr, record: :new_episodes do
    facebook_share = user.facebook_pages.first.facebook_shares.new(content: Faker::Lorem.paragraph)
    facebook_share.share

    perform_enqueued_jobs { FacebookShareJob.perform_now(facebook_share)
    }

    expect(facebook_share.share_id).not_to be(nil)
    expect(facebook_share.share_url).not_to be(nil)
  end

end

describe FacebookShare, "#delete_share" do
  include ActiveJob::TestHelper

  let(:user) { create_from_omniauth }

  it "creates a FacebookShareDeleteJob", :vcr, record: :new_episodes do
    facebook_share = user.facebook_pages.first.facebook_shares.new(content: Faker::Lorem.paragraph)
    facebook_share.share
    facebook_share.delete_share

    expect(enqueued_jobs.size).to eq(2)
  end

  it "deletes a share from Facebook", :vcr, record: :new_episodes do
    facebook_share = user.facebook_pages.first.facebook_shares.new(content: Faker::Lorem.paragraph)
    facebook_share.share

    perform_enqueued_jobs { FacebookShareJob.perform_now(facebook_share)
    }

    facebook_share.delete_share

    perform_enqueued_jobs {
      FacebookShareDeleteJob.perform_now(facebook_share)
    }

    expect(facebook_share.deleted_at).not_to be(nil)
  end

end

describe FacebookShare, "#get_share_type" do

  context "link" do
    it "adds 'link' to share_type for link share" do
      facebook_share = create(:facebook_share, :link)
      facebook_share.get_share_type

      expect(facebook_share.share_type).to eq("link")
    end
  end

  context "text" do
    it "adds 'text' to share_type for text share" do
      facebook_share = create(:facebook_share)
      facebook_share.get_share_type

      expect(facebook_share.share_type).to eq("text")
    end
  end
end
