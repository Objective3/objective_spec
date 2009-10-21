require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= class_name %>Controller do
  describe "handling GET /<%= table_name %>" do
  
    it "should be successful" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.stub!(:find).and_return([<%= file_name.singularize %>])
      get :index, :format => 'xml'
      response.should be_success
    end
  
    it "should find all <%= table_name %>" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.should_receive(:find).with(:all).and_return([<%= file_name.singularize %>])
      get :index, :format => 'xml'
    end
  
    it "should assign the found <%= table_name %> for the view" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.stub!(:find).and_return([<%= file_name.singularize %>])
      get :index, :format => 'xml'
      assigns[:<%= file_name.singularize %>].should == [<%= file_name.singularize %>]
    end
  end

  describe "handling GET /<%= table_name %>/1" do

    it "should be successful" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
      get :show, :id => "1", :format => 'xml'
      response.should be_success
    end
  
    it "should find the <%= file_name.singularize %> requested" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name.singularize %>)
      get :show, :id => "1", :format => 'xml'
    end
  
    it "should assign the found <%= file_name.singularize %> for the view" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
      get :show, :id => "1", :format => 'xml'
      assigns[:<%= file_name.singularize %>].should equal(<%= file_name.singularize %>)
    end
  end

  describe "handling POST /<%= table_name %>" do
    
    describe "with successful save" do
  
      it "should create a new <%= file_name.singularize %>" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.should_receive(:new).with({}).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name.singularize %> => {}, :format => 'xml'
      end

      it "should be successful" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name %> => {}, :format => 'xml'
        response.should be_success
      end
      
    end
    
    describe "with failed save" do
      
      it "should be unprocessable" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:save).and_return(false)
        post :create, :<%= file_name.singularize %> => {}, :format => 'xml'
        response.code.should == '422'
      end
      
      it "should return errors" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:save).and_return(false)
        post :create, :<%= file_name.singularize %> => {}, :format => 'xml'
        Nokogiri::XML(response.body).at('errors').should_not be_nil
      end
      
    end
  end

  describe "handling PUT /<%= table_name %>/1" do
    
    describe "with successful update" do

      it "should find the <%= file_name.singularize %> requested" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
      end

      it "should update the found <%= file_name.singularize %>" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        assigns(:<%= file_name.singularize %>).should equal(<%= file_name.singularize %>)
      end

      it "should assign the found <%= file_name.singularize %> for the view" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        assigns(:<%= file_name.singularize %>).should equal(<%= file_name.singularize %>)
      end

      it "should be successful" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        response.should be_success
      end

    end
    
    describe "with failed update" do

      it "should render errors" do
        <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
        <%= file_name.singularize %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
        <%= file_name.singularize %>.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1", :format => 'xml'
        Nokogiri::XML(response.body).at('errors').should_not be_nil
      end

    end
  end

  describe "handling DELETE /<%= table_name %>/1" do

    it "should find the <%= file_name %> requested" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= file_name.singularize %>.stub!(:destroy).and_return(true)
      <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name.singularize %>)
      delete :destroy, :id => "1", :format => 'xml'
    end
  
    it "should call destroy on the found <%= file_name %>" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
      <%= file_name.singularize %>.should_receive(:destroy).and_return(true) 
      delete :destroy, :id => "1", :format => 'xml'
    end
  
    it "should succeed" do
      <%= file_name.singularize %> = Factory(:<%= file_name.singularize %>)
      <%= file_name.singularize %>.stub!(:destroy).and_return(true)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name.singularize %>)
      delete :destroy, :id => "1", :format => 'xml'
      response.should be_success
    end
  end
end
