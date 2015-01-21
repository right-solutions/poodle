require "poodle/engine"
require "poodle/configuration"
require 'poodle/action_view/form_helper'
require 'poodle/action_view/modal_helper'
require 'poodle/action_view/theme_helper'

require 'poodle/railtie' if defined?(Rails)

module Poodle
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
