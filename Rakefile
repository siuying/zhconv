require 'rubygems'
require 'bundler/setup'

require 'rake/testtask'
require 'echoe'

Echoe.new('zhconverter', '0.1.0') do |p|
  p.description    = "Convert chinese using mediawiki conversion table"
  p.url            = "http://github.com/siuying/zhconv"
  p.author         = "Francis Chong"
  p.email          = "francis@ignition.hk"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.pattern = "test/test_*.rb"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

