require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= class_name %>Observer do
  
  it "should observe <%= class_name %>" do
    <%= file_name %> = Factory(:<%= file_name %>)
    observer = <%= class_name %>Observer.instance
    observer.after_create(<%= file_name %>)
  end
  
end