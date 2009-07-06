require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/index.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before(:each) do
<% [98,99].each do |id| -%>
    <%= file_name %>_<%= id %> = Factory(:<%= file_name %>)
<% end -%>
    assigns[:<%= table_name %>] = [<%= file_name %>_98, <%= file_name %>_99]

    template.stub!(:object_url).and_return(<%= file_name %>_path(<%= file_name %>_99))
    template.stub!(:new_object_url).and_return(new_<%= file_name %>_path) 
    template.stub!(:edit_object_url).and_return(edit_<%= file_name %>_path(<%= file_name %>_99))
  end

  it "should render list of <%= table_name %>" do
    render "/<%= table_name %>/index.<%= default_file_extension %>"
  end
end

