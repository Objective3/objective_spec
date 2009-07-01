class ObjectiveSpecGenerator < Rails::Generator::Base
  
  def initialize(runtime_args, runtime_options = {})      
    puts <<-INFO

You are installing Objective Spec. After this generator has completed, you
will need to add require 'objective_spec' to your spec/spec_helper.rb file
to load the library.

INFO
    end
    super
  end
  
  def manifest
    record do |m|
      m.directory 'spec/mailers'
      m.directory 'spec/matchers'
      m.directory 'spec/spec_helpers'
      m.file      'spec/spec_helpers/common.rb',          'spec_helpers/common.rb'
      m.file      'spec/spec_helpers/model.rb',           'spec_helpers/model.rb'
      m.file      'spec/spec_helpers/view.rb',            'spec_helpers/view.rb'
      m.file      'spec/spec_helpers/controller.rb',      'spec_helpers/controller.rb'
    end
  end
  
protected

  def banner
    "Usage: #{$0} objective_spec"
  end
  
end
