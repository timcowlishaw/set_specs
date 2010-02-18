# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{set_specs}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Cowlishaw"]
  s.date = %q{2010-02-18}
  s.email = %q{tim@timcowlishaw.co.uk}
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "spec", "lib/set_specs.rb"]
  s.homepage = %q{http://github.com/timcowlishaw/set_specs/}
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{set_specs}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A few Rspec matchers for making assertions about set-like properties of Enumerables.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
