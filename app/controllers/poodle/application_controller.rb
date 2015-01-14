class Poodle::ApplicationController < ActionController::Base

  ## This filter method is used to fetch current user
  before_filter :current_user

  include Poodle::ParamsParserHelper
  include Poodle::FlashHelper
  include Poodle::UrlHelper
  include Poodle::TitleHelper
  include Poodle::ImageHelper
  include Poodle::NavigationHelper
  include Poodle::SessionsHelper
  include Poodle::NotificationHelper

end
