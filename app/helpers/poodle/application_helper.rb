module Poodle
  module ApplicationHelper

    def url_for(options = nil)
      main_app.url_for(options)
    end

    # Can search for named routes directly in the main app, omitting
    # the "main_app." prefix
    def method_missing(method, *args, &block)
      if main_app_url_helper?(method)
        main_app.send(method, *args)
      else
        super
      end
    end

    def respond_to?(method)
      main_app_url_helper?(method) or super
    end

    def stylesheet_filename
      @stylesheet_filename || "poodle/application"
    end

    def javascript_filename
      @javascript_filename || "poodle/application"
    end

   private

    def main_app_url_helper?(method)
      (method.to_s.end_with?('_path') or method.to_s.end_with?('_url')) and
        main_app.respond_to?(method)
    end
  end
end
