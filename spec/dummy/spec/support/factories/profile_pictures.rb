FactoryGirl.define do
  factory :profile_picture do
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/support/factories/test.jpg', 'image/jpg') }
    user
  end
end
