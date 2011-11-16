# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "zhconv"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Francis Chong"]
  s.date = "2011-11-16"
  s.description = "Convert chinese using mediawiki conversion table"
  s.email = "francis@ignition.hk"
  s.extra_rdoc_files = ["README.rdoc", "lib/zhconv.rb"]
  s.files = ["Gemfile", "Gemfile.lock", "Manifest", "README.rdoc", "Rakefile", "data/zh-cn.txt", "data/zh-hans.txt", "data/zh-hant.txt", "data/zh-hk.txt", "data/zh-sg.txt", "data/zh-tw.txt", "lib/zhconv.rb", "test/test_zhconv.rb", "zhconv.gemspec"]
  s.homepage = "http://github.com/siuying/zhconv"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Zhconv", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "zhconv"
  s.rubygems_version = "1.8.10"
  s.summary = "Convert chinese using mediawiki conversion table"
  s.test_files = ["test/test_zhconv.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
