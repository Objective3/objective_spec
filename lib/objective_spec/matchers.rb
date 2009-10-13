module ObjectiveSpec
  class Matchers
    def load!
      load_matchers_in_dir(bundled_matchers_dir)
    end
  
    def load_matchers_in_dir(dir)
      Dir.entries(dir).each do |entry|
        if entry =~ /_matcher.rb$/
          filename = entry.gsub(/.rb$/, '')
          require File.join(dir, filename)
        end
      end
    end

    def bundled_matchers_dir
      File.join(File.dirname(__FILE__), 'matchers')
    end

    def self.load!
      self.new.load!
    end
  end
end

ObjectiveSpec::Matchers.load!
