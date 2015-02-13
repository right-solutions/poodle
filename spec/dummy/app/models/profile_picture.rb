class ProfilePicture < ActiveRecord::Base

  # Associations
  belongs_to :user

  mount_uploader :image, ImageUploader

end
