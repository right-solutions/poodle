class User < ActiveRecord::Base

  has_one :profile_picture, :as => :imageable, :dependent => :destroy, :class_name => "Image::ProfilePicture"

end
