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
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1", ">= 4.1.5"
  s.add_dependency "handy-css-rails", "~> 0.0", ">= 0.0.7"
  s.add_dependency "jquery-validation-rails", "~> 1.12", ">= 1.12.0"
end
