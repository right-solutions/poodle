FactoryGirl.define do
  factory :profile_picture, :class => Image::ProfilePicture do
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/support/factories/test.jpg', 'image/jpg') }
    association :imageable, :factory => :user
  end
end
