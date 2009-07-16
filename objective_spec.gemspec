# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{objective_spec}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Watters"]
  s.date = %q{2009-07-16}
  s.email = %q{blake@objective3.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO",
     "VERSION",
     "generators/objective_controller/USAGE",
     "generators/objective_controller/objective_controller_generator.rb",
     "generators/objective_controller/templates/controller_spec.rb",
     "generators/objective_controller/templates/helper_spec.rb",
     "generators/objective_controller/templates/view.html.haml",
     "generators/objective_controller/templates/view_spec.rb",
     "generators/objective_model/objective_model_generator.rb",
     "generators/objective_model/templates/model_spec.rb",
     "generators/objective_resource/.DS_Store",
     "generators/objective_resource/objective_resource_generator.rb",
     "generators/objective_resource/templates/.DS_Store",
     "generators/objective_resource/templates/controller.rb",
     "generators/objective_resource/templates/helper.rb",
     "generators/objective_resource/templates/migration.rb",
     "generators/objective_resource/templates/model.rb",
     "generators/objective_resource/templates/rspec/functional_spec.rb",
     "generators/objective_resource/templates/rspec/helper_spec.rb",
     "generators/objective_resource/templates/rspec/routing_spec.rb",
     "generators/objective_resource/templates/rspec/unit_spec.rb",
     "generators/objective_resource/templates/rspec/views/edit_spec.rb",
     "generators/objective_resource/templates/rspec/views/index_spec.rb",
     "generators/objective_resource/templates/rspec/views/new_spec.rb",
     "generators/objective_resource/templates/rspec/views/show_spec.rb",
     "generators/objective_resource/templates/view__form.haml",
     "generators/objective_resource/templates/view_edit.haml",
     "generators/objective_resource/templates/view_index.haml",
     "generators/objective_resource/templates/view_new.haml",
     "generators/objective_resource/templates/view_show.haml",
     "generators/objective_spec/objective_spec_generator.rb",
     "generators/objective_spec/templates/spec_helpers/common.rb",
     "generators/objective_spec/templates/spec_helpers/controller.rb",
     "generators/objective_spec/templates/spec_helpers/model.rb",
     "generators/objective_spec/templates/spec_helpers/shared_examples.rb",
     "generators/objective_spec/templates/spec_helpers/view.rb",
     "generators/rspec_default_values.rb",
     "init.rb",
     "lib/objective_spec.rb",
     "lib/objective_spec/assets.rb",
     "lib/objective_spec/mailer_example_group.rb",
     "lib/objective_spec/matchers.rb",
     "lib/objective_spec/matchers/use_layout_matcher.rb",
     "lib/objective_spec/spec_helpers.rb",
     "spec/objective_spec_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Objective3/objective_spec}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/objective_spec_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
