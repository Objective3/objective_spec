# Load all files inside spec/matchers
spec_helpers_dir = File.join(Rails.root, 'spec', 'spec_helpers')
Dir.entries(spec_helpers_dir).each do |entry|
  if entry =~ /.rb$/
    filename = entry.gsub(/.rb$/, '')
    require File.join(spec_helpers_dir, filename)
  end
end
