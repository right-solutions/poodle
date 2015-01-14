$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "poodle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "poodle"
  s.version     = Poodle::VERSION
  s.authors     = ["Krishnaprasad Varma"]
  s.email       = ["krshnaprsad@gmail.com"]
  s.homepage    = "http://kpvarma.com"
  s.summary     = "Poodle is a Q-Apps client engine"
  s.description = "Poodle can be mounted into a Q-App so that poodle will deal with all q-apps services like authentication and UI"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.5"
  s.add_dependency "handy-css-rails", "~> 0.0.7"
  #s.add_dependency "humdrum", "~> 0.0.7"
  s.add_dependency "jquery-validation-rails"

end
