require 'spec_helper'

describe ProfilePicturesController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:user_with_image) {FactoryGirl.create(:user_with_image)}

  context "new" do
    it "should display the form" do
      xhr :get, :new, {image_type: "Image::ProfilePicture", imageable_type: "User", imageable_id: user.id}, {}
      expect(assigns(:image)).to be_a Image::ProfilePicture
      expect(assigns(:resource)).to eq(user)
      expect(response.code).to eq("200")
    end
  end

  context "create" do
    it "positive case" do
      image = Rack::Test::UploadedFile.new(Rails.root + 'spec/support/factories/test.jpg', 'image/jpg')
      valid_params = {image: image, image_type: "Image::ProfilePicture", imageable_type: "User", imageable_id: user.id}
      post :create, valid_params, {}
      expect(assigns(:image)).to be_a Image::ProfilePicture
      expect(assigns(:resource)).to eq(user)
      expect(Image::ProfilePicture.count).to  eq 1
      expect(response.status).to eq(200)
    end
  end

  context "edit" do
    it "should display the form" do
      xhr :get, :edit, {id: user_with_image.profile_picture.id, image_type: "Image::ProfilePicture", imageable_type: "User", imageable_id: user_with_image.id}, {}
      expect(assigns(:image)).to be_a Image::ProfilePicture
      expect(assigns(:resource)).to eq(user_with_image)
      expect(response.code).to eq("200")
    end
  end

  context "update" do
    it "positive case" do
      image = Rack::Test::UploadedFile.new(Rails.root + 'spec/support/factories/test.jpg', 'image/jpg')
      valid_params = {id: user_with_image.profile_picture.id, image: image, image_type: "Image::ProfilePicture", imageable_type: "User", imageable_id: user_with_image.id}
      put :update, valid_params, {}
      expect(assigns(:image)).to be_a Image::ProfilePicture
      expect(assigns(:resource)).to eq(user_with_image)
      expect(Image::ProfilePicture.count).to  eq 1
      expect(response.status).to eq(200)
    end
  end

end