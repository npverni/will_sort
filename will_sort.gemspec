# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{will_sort}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Verni"]
  s.date = %q{2008-12-04}
  s.description = %q{A wrapper for handeling sort_by params}
  s.email = %q{npverni@gmail.com}
  s.extra_rdoc_files = ["lib/will_sort.rb", "README.rdoc"]
  s.files = ["lib/will_sort.rb", "Manifest", "Rakefile", "README.rdoc", "will_sort.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/npverni/will_sort}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Will_sort", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{will_sort}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A wrapper for handeling sort_by params}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
