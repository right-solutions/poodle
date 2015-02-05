module Poodle
  class Engine < ::Rails::Engine
    isolate_namespace Poodle

    initializer "poodle.configure_rails_initialization" do |app|

      ActiveSupport.on_load :action_view do
        include Poodle::ActionView::FormHelper
        include Poodle::ActionView::ModalHelper
        include Poodle::ActionView::ThemeHelper
      end

      ActiveSupport.on_load :action_controller do
        include Poodle::DisplayHelper
        include Poodle::FlashHelper
        include Poodle::ImageHelper
        include Poodle::MetaTagsHelper
        include Poodle::NavigationHelper
        include Poodle::ParamsParserHelper
        include Poodle::TitleHelper
        include Poodle::UrlHelper
        helper Poodle::DisplayHelper
        helper Poodle::FlashHelper
        helper Poodle::ImageHelper
        helper Poodle::MetaTagsHelper
        helper Poodle::NavigationHelper
        helper Poodle::ParamsParserHelper
        helper Poodle::TitleHelper
        helper Poodle::UrlHelper
      end
    end
  end
end
