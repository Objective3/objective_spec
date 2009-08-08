class ObjectiveObserverGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions "#{class_name}Observer"

      # Observer, and test directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('spec/observers', class_path)

      # Observer class and unit test fixtures.
      m.template 'observer.rb',   File.join('app/models', class_path, "#{file_name}_observer.rb")
      m.template 'observer_spec.rb',  File.join('spec/observers', class_path, "#{file_name}_observer_spec.rb")
    end
  end
end
