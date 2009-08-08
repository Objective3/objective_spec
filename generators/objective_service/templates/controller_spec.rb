require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= class_name %>Controller do
  describe "handling GET /<%= table_name %>" do
  
    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.stub!(:find).and_return([<%= file_name %>])
      get :index, :format => 'xml'
      response.should be_success
    end
  
    it "should find all <%= table_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.should_receive(:find).with(:all).and_return([<%= file_name %>])
      get :index, :format => 'xml'
    end
  
    it "should assign the found <%= table_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.stub!(:find).and_return([<%= file_name %>])
      get :index, :format => 'xml'
      assigns[:<%= table_name %>].should == [<%= file_name %>]
    end
  end

  describe "handling GET /<%= table_name %>/1" do

    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :show, :id => "1", :format => 'xml'
      response.should be_success
    end
  
    it "should find the <%= file_name %> requested" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
      get :show, :id => "1", :format => 'xml'
    end
  
    it "should assign the found <%= file_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :show, :id => "1", :format => 'xml'
      assigns[:<%= file_name %>].should equal(<%= file_name %>)
    end
  end

  describe "handling POST /<%= table_name %>" do
    
    describe "with successful save" do
  
      it "should create a new <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.should_receive(:new).with({}).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name %> => {}, :format => 'xml'
      end

      it "should be successful" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name %> => {}, :format => 'xml'
        response.should be_success
      end
      
    end
    
    describe "with failed save" do
      
      it "should be unprocessable" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(false)
        post :create, :<%= file_name %> => {}, :format => 'xml'
        response.code.should == '422'
      end
      
      it "should return errors" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(false)
        post :create, :<%= file_name %> => {}, :format => 'xml'
        Nokogiri::XML(response.should).at('errors').should_not be_nil
      end
      
    end
  end

  describe "handling PUT /<%= table_name %>/1" do
    
    describe "with successful update" do

      it "should find the <%= file_name %> requested" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
      end

      it "should update the found <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        assigns(:<%= file_name %>).should equal(<%= file_name %>)
      end

      it "should assign the found <%= file_name %> for the view" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        assigns(:<%= file_name %>).should equal(<%= file_name %>)
      end

      it "should be successful" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :format => 'xml'
        response.should be_success
      end

    end
    
    describe "with failed update" do

      it "should render errors" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1", :format => 'xml'
        Nokogiri::XML(response.body).at('errors').should_not be_nil
      end

    end
  end

  describe "handling DELETE /<%= table_name %>/1" do

    it "should find the <%= file_name %> requested" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= file_name %>.stub!(:destroy).and_return(true)
      <%= class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
      delete :destroy, :id => "1", :format => 'xml'
    end
  
    it "should call destroy on the found <%= file_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      <%= file_name %>.should_receive(:destroy).and_return(true) 
      delete :destroy, :id => "1", :format => 'xml'
    end
  
    it "should succeed" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= file_name %>.stub!(:destroy).and_return(true)
      <%= class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      delete :destroy, :id => "1", :format => 'xml'
      response.should be_success
    end
  end
end
