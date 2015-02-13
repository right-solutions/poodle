class User < ActiveRecord::Base

  has_one :profile_picture, :dependent => :destroy

end
