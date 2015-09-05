require 'carrierwave/test/matchers'

describe VideoUploader do
  include CarrierWave::Test::Matchers

  let(:facebook_share) { build(:facebook_share) }

  before do

    VideoUploader.enable_processing = true
    @uploader = VideoUploader.new(facebook_share, :video)

    File.open("spec/fixtures/video.mov") do |f|
      @uploader.store!(f)
    end
  end

  after do
    VideoUploader.enable_processing = false
    @uploader.remove!
  end

  it "uploads a video" do
    expect(facebook_share.video).not_to be(nil)
  end

end
