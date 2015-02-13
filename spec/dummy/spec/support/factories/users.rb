FactoryGirl.define do

  factory :user do
    name "First Middle Last"
  end

  factory :user_with_image, parent: :user do
    after(:create) do |user|
      FactoryGirl.create(:profile_picture, user: user)
    end
  end

end
