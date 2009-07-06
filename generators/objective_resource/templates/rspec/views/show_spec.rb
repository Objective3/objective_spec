require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/show.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before(:each) do
    @<%= file_name %> = Factory(:<%= file_name %>)

    assigns[:<%= file_name %>] = @<%= file_name %>

    template.stub!(:edit_object_url).and_return(edit_<%= file_name %>_path(@<%= file_name %>)) 
    template.stub!(:collection_url).and_return(<%= file_name.pluralize %>_path) 
  end

  it "should render attributes in <p>" do
    render "/<%= table_name %>/show.<%= default_file_extension %>"
  end
end

