require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "objective_spec"
    gem.summary = "A set of extensions to RSpec for building Rails applications against Objective Spec"
    gem.email = "blake@objective3.com"
    gem.homepage = "http://github.com/Objective3/objective_spec"
    gem.authors = ["Blake Watters"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new  
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "objective_spec #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


task :rebuild do
  if File.exist?('VERSION')
    version = File.read('VERSION').chomp
  else
    puts "Unable to rebuild -- no VERSION.yml found"
    exit 1
  end
  command = "sudo gem uninstall objective_spec; rake gemspec; rm objective_spec-#{version}.gem objective_spec.gemspec ; rake gemspec; gem build objective_spec.gemspec && sudo gem install objective_spec-#{version}.gem"
  puts(`#{command}`)  
end
