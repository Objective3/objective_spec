require 'rails_generator/generators/components/model/model_generator'
require File.dirname(__FILE__) + '/../rspec_default_values'

class ObjectiveModelGenerator < ModelGenerator

  def manifest

    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name

      # Model, spec, and fixture directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('spec/models', class_path)

      # Model class, spec and fixtures.
      m.template 'model:model.rb',      File.join('app/models', class_path, "#{file_name}.rb")
      m.template 'model_spec.rb',       File.join('spec/models', class_path, "#{file_name}_spec.rb")

      unless options[:skip_migration]
        m.migration_template 'model:migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
        }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
      end
      
      model_factory = "\n\nFactory.define(:#{file_name}) do |f|\n"
      for attribute in attributes
        model_factory << "\tf.#{attribute.name} #{attribute.default_value}\n"
      end
      model_factory << "end\n"
      append_file("spec/factories.rb", model_factory)
      
    end
  end
  
  def append_file(path, data)
    File.open(path, 'ab') { |file| file.write(data) }
  end
  
end
