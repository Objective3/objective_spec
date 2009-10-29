class ObjectiveSpecGenerator < Rails::Generator::Base
  
  def initialize(runtime_args, runtime_options = {})      
    puts <<-INFO

You are installing Objective Spec. After this generator has completed, you
will need to add require 'objective_spec' to your spec/spec_helper.rb file
to load the library.

INFO
    super
  end
  
  def manifest
    record do |m|
      m.directory 'spec/mailers'
      m.directory 'spec/support'
      m.file      'spec_helpers/common.rb',             'spec/support/common_spec_helper.rb'
      m.file      'spec_helpers/model.rb',              'spec/support/model_spec_helper.rb'
      m.file      'spec_helpers/view.rb',               'spec/support/view_spec_helper.rb'
      m.file      'spec_helpers/controller.rb',         'spec/support/controller_spec_helper.rb'
      m.file      'spec_helpers/shared_examples.rb',    'spec/support/shared_examples.rb'
    end
  end
  
protected

  def banner
    "Usage: #{$0} objective_spec"
  end
  
end
