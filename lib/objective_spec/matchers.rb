# Load all files inside spec/matchers
matchers_dir = File.join(Rails.root, 'spec', 'matchers')
Dir.entries(matchers_dir).each do |entry|
  if entry =~ /_matcher.rb$/
    filename = entry.gsub(/.rb$/, '')
    require File.join(matchers_dir, filename)
  end
end
