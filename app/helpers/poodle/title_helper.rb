module Poodle
  module TitleHelper
    def set_heading(heading)
      @heading = heading
    end

    def set_title(title)
      @title = title
    end

    def title
      @title || "Q-App | Poodle Client"
    end
  end
end
