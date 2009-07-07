require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../spec_helper')

describe <%= class_name %> do

  it "should be valid" do
    <%= file_name %> = Factory(:<%= file_name %>)
    <%= file_name %>.should be_valid
  end
  
end
