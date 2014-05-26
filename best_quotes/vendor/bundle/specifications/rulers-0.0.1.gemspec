# -*- encoding: utf-8 -*-
# stub: rulers 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rulers"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Derik Strattan"]
  s.date = "2013-11-04"
  s.description = "Creating a rails app from scratch using Ruby"
  s.email = ["derik.strattan@gmail.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.0"
  s.summary = "Use rebuilding-rails.com"

  s.installed_by_version = "2.2.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
  end
end
