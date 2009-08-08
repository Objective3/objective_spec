require 'rails_generator/generators/components/controller/controller_generator'

class ObjectiveServiceGenerator < ControllerGenerator

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, "#{class_name}Controller", "#{class_name}Helper"

      # Controller, helper, views, and spec directories.
      m.directory File.join('app/controllers', class_path)
      m.directory File.join('spec/controllers', class_path)

      # Controller spec, class, and helper.
      m.template 'controller_spec.rb',
        File.join('spec/controllers', class_path, "#{file_name}_controller_spec.rb")

      m.template 'controller.rb',
        File.join('app/controllers', class_path, "#{file_name}_controller.rb")
    end
  end
end
