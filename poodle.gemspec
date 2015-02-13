$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "poodle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "poodle-rb"
  s.version     = Poodle::VERSION
  s.authors     = ["Krishnaprasad Varma"]
  s.email       = ["krshnaprsad@gmail.com"]
  s.homepage    = "http://kpvarma.com"
  s.summary     = "Poodle is Rails Starter Kit"
  s.description = "Poodle is a started kit for creating Rails Application. Poodle comes with built in UI (layout, css/JS) and some helpers which boost the creation of any prototype application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency "kaminari", "~> 0.16.2", ">= 0.16.0"
  s.add_runtime_dependency "handy-css-rails", "~> 0.0", ">= 0.0.7"
  s.add_runtime_dependency "bootstrap-kaminari-views", "~> 0.0.5", ">= 0.0.3"
  s.add_runtime_dependency "bootstrap-datepicker-rails", "~> 1.3.1.1", ">= 1.3.0.2"
  s.add_runtime_dependency "jquery-validation-rails", "~> 1.12", ">= 1.12.0"

  s.add_dependency "rails", "~> 4.1", ">= 4.1.5"

  s.add_development_dependency 'pry', "~> 0.10.1", ">= 0.10.0"
  s.add_development_dependency 'sqlite3', "~> 1.3.10", ">= 1.3.9"
  s.add_development_dependency 'carrierwave', "~> 0.10.0", ">= 0.9.0"
  s.add_development_dependency 'rmagick', "~> 2.13.3", ">= 2.13.2"
  s.add_development_dependency 'rspec-rails', "~> 3.2.0", ">= 3.1.0"
  s.add_development_dependency 'capybara', "~> 2.4.4", ">= 2.4.3"
  s.add_development_dependency 'factory_girl_rails', "~> 4.5.0", ">= 4.4.0"
  s.add_development_dependency 'database_cleaner', "~> 1.4.0", ">= 1.3.0"

end
