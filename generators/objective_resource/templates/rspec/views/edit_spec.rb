require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/edit.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before do
    @<%= file_name %> = Factory(:<%= file_name %>)
    assigns[:<%= file_name %>] = @<%= file_name %>

    template.should_receive(:object_url).twice.and_return(<%= file_name %>_path(@<%= file_name %>)) 
    template.should_receive(:collection_url).and_return(<%= file_name.pluralize %>_path) 
  end

  it "should render edit form" do
    render "/<%= table_name %>/edit.<%= default_file_extension %>"
    
    response.should have_tag("form[action=#{<%= file_name %>_path(@<%= file_name %>)}][method=post]") do
      # Test attributes here
    end
  end
end


