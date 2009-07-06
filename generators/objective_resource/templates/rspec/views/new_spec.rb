require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/new.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before(:each) do
    @<%= file_name %> = Factory(:<%= file_name %>)
    @<%= file_name %>.stub!(:new_record?).and_return(true)
    assigns[:<%= file_name %>] = @<%= file_name %>


    template.stub!(:object_url).and_return(<%= file_name %>_path(@<%= file_name %>)) 
    template.stub!(:collection_url).and_return(<%= file_name.pluralize %>_path) 
  end

  it "should render new form" do
    render "/<%= table_name %>/new.<%= default_file_extension %>"
    
    response.should have_tag("form[action=?][method=post]", <%= table_name %>_path) do
      # Test attributes here
    end
  end
end
