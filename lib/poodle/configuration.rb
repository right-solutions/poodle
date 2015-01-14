module Poodle
  class Configuration
    attr_accessor :refresh_page_in_milli_seconds,
                  :items_per_list,
                  :max_items_per_list

    def initialize
      @refresh_page_in_milli_seconds = 18000
      @items_per_list = 10
      @max_items_per_list = 250
    end

  end
end