require 'carrierwave/test/matchers'

describe PhotoUploader do
  include CarrierWave::Test::Matchers

  let(:facebook_share) { build(:facebook_share) }

  before do

    PhotoUploader.enable_processing = true
    @uploader = PhotoUploader.new(facebook_share, :photo)

    File.open("spec/fixtures/test.png") do |f|
      @uploader.store!(f)
    end
  end

  after do
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  it "uploads a photo" do
    expect(facebook_share.photo).not_to be(nil)
  end

end
