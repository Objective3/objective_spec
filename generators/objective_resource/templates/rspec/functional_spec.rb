require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../spec_helper')

describe <%= controller_class_name %>Controller do
  describe "handling GET /<%= table_name %>" do
  
    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return([<%= file_name %>])
      get :index
      response.should be_success
    end

    it "should render index template" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return([<%= file_name %>])
      get :index
      response.should render_template('index')
    end
  
    it "should find all <%= table_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.should_receive(:find).with(:all).and_return([<%= file_name %>])
      get :index
    end
  
    it "should assign the found <%= table_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return([<%= file_name %>])
      get :index
      assigns[:<%= table_name %>].should == [<%= file_name %>]
    end
  end

  describe "handling GET /<%= table_name %>/1" do

    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :show, :id => "1"
      response.should be_success
    end
  
    it "should render show template" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :show, :id => "1"
      response.should render_template('show')
    end
  
    it "should find the <%= file_name %> requested" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
      get :show, :id => "1"
    end
  
    it "should assign the found <%= file_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :show, :id => "1"
      assigns[:<%= file_name %>].should equal(<%= file_name %>)
    end
  end

  describe "handling GET /<%= table_name %>/new" do

    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
      get :new
      response.should be_success
    end
  
    it "should render new template" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
      get :new
      response.should render_template('new')
    end
  
    it "should create an new <%= file_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.should_receive(:new).and_return(<%= file_name %>)
      get :new
    end
  
    it "should not save the new <%= file_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
      <%= file_name %>.should_not_receive(:save)
      get :new
    end
  
    it "should assign the new <%= file_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
      get :new
      assigns[:<%= file_name %>].should equal(<%= file_name %>)
    end
  end

  describe "handling GET /<%= table_name %>/1/edit" do

    it "should be successful" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :edit, :id => "1"
      response.should be_success
    end
  
    it "should render edit template" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :edit, :id => "1"
      response.should render_template('edit')
    end
  
    it "should find the <%= file_name %> requested" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.should_receive(:find).and_return(<%= file_name %>)
      get :edit, :id => "1"
    end
  
    it "should assign the found <%= controller_class_name %> for the view" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      get :edit, :id => "1"
      assigns[:<%= file_name %>].should equal(<%= file_name %>)
    end
  end

  describe "handling POST /<%= table_name %>" do
    
    describe "with successful save" do
  
      it "should create a new <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.should_receive(:new).with({}).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name %> => {}
      end

      it "should redirect to the new <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(true)
        post :create, :<%= file_name %> => {}
        response.should redirect_to(<%= table_name.singularize %>_url("1"))
      end
      
    end
    
    describe "with failed save" do
  
      it "should re-render 'new'" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:new).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:save).and_return(false)
        post :create, :<%= file_name %> => {}
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /<%= table_name %>/1" do
    
    describe "with successful update" do

      it "should find the <%= file_name %> requested" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should update the found <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
        assigns(:<%= file_name %>).should equal(<%= file_name %>)
      end

      it "should assign the found <%= file_name %> for the view" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
        assigns(:<%= file_name %>).should equal(<%= file_name %>)
      end

      it "should redirect to the <%= file_name %>" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
        response.should redirect_to(<%= table_name.singularize %>_url("1"))
      end

    end
    
    describe "with failed update" do

      it "should re-render 'edit'" do
        <%= file_name %> = Factory(:<%= file_name %>)
        <%= file_name %>.stub!(:to_param).and_return("1")
        <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
        <%= file_name %>.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /<%= table_name %>/1" do

    it "should find the <%= file_name %> requested" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= file_name %>.stub!(:destroy).and_return(true)
      <%= controller_class_name.singularize %>.should_receive(:find).with("1").and_return(<%= file_name %>)
      delete :destroy, :id => "1"
    end
  
    it "should call destroy on the found <%= file_name %>" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      <%= file_name %>.should_receive(:destroy).and_return(true) 
      delete :destroy, :id => "1"
    end
  
    it "should redirect to the <%= table_name %> list" do
      <%= file_name %> = Factory(:<%= file_name %>)
      <%= file_name %>.stub!(:destroy).and_return(true)
      <%= controller_class_name.singularize %>.stub!(:find).and_return(<%= file_name %>)
      delete :destroy, :id => "1"
      response.should redirect_to(<%= table_name %>_url)
    end
  end
end
