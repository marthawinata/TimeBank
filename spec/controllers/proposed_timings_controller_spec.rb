require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProposedTimingsController do

  # This should return the minimal set of attributes required to create a valid
  # ProposedTiming. As you add validations to ProposedTiming, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all proposed_timings as @proposed_timings" do
      proposed_timing = ProposedTiming.create! valid_attributes
      get :index
      assigns(:proposed_timings).should eq([proposed_timing])
    end
  end

  describe "GET show" do
    it "assigns the requested proposed_timing as @proposed_timing" do
      proposed_timing = ProposedTiming.create! valid_attributes
      get :show, :id => proposed_timing.id
      assigns(:proposed_timing).should eq(proposed_timing)
    end
  end

  describe "GET new" do
    it "assigns a new proposed_timing as @proposed_timing" do
      get :new
      assigns(:proposed_timing).should be_a_new(ProposedTiming)
    end
  end

  describe "GET edit" do
    it "assigns the requested proposed_timing as @proposed_timing" do
      proposed_timing = ProposedTiming.create! valid_attributes
      get :edit, :id => proposed_timing.id
      assigns(:proposed_timing).should eq(proposed_timing)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProposedTiming" do
        expect {
          post :create, :proposed_timing => valid_attributes
        }.to change(ProposedTiming, :count).by(1)
      end

      it "assigns a newly created proposed_timing as @proposed_timing" do
        post :create, :proposed_timing => valid_attributes
        assigns(:proposed_timing).should be_a(ProposedTiming)
        assigns(:proposed_timing).should be_persisted
      end

      it "redirects to the created proposed_timing" do
        post :create, :proposed_timing => valid_attributes
        response.should redirect_to(ProposedTiming.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved proposed_timing as @proposed_timing" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProposedTiming.any_instance.stub(:save).and_return(false)
        post :create, :proposed_timing => {}
        assigns(:proposed_timing).should be_a_new(ProposedTiming)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProposedTiming.any_instance.stub(:save).and_return(false)
        post :create, :proposed_timing => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested proposed_timing" do
        proposed_timing = ProposedTiming.create! valid_attributes
        # Assuming there are no other proposed_timings in the database, this
        # specifies that the ProposedTiming created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProposedTiming.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => proposed_timing.id, :proposed_timing => {'these' => 'params'}
      end

      it "assigns the requested proposed_timing as @proposed_timing" do
        proposed_timing = ProposedTiming.create! valid_attributes
        put :update, :id => proposed_timing.id, :proposed_timing => valid_attributes
        assigns(:proposed_timing).should eq(proposed_timing)
      end

      it "redirects to the proposed_timing" do
        proposed_timing = ProposedTiming.create! valid_attributes
        put :update, :id => proposed_timing.id, :proposed_timing => valid_attributes
        response.should redirect_to(proposed_timing)
      end
    end

    describe "with invalid params" do
      it "assigns the proposed_timing as @proposed_timing" do
        proposed_timing = ProposedTiming.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProposedTiming.any_instance.stub(:save).and_return(false)
        put :update, :id => proposed_timing.id, :proposed_timing => {}
        assigns(:proposed_timing).should eq(proposed_timing)
      end

      it "re-renders the 'edit' template" do
        proposed_timing = ProposedTiming.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProposedTiming.any_instance.stub(:save).and_return(false)
        put :update, :id => proposed_timing.id, :proposed_timing => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested proposed_timing" do
      proposed_timing = ProposedTiming.create! valid_attributes
      expect {
        delete :destroy, :id => proposed_timing.id
      }.to change(ProposedTiming, :count).by(-1)
    end

    it "redirects to the proposed_timings list" do
      proposed_timing = ProposedTiming.create! valid_attributes
      delete :destroy, :id => proposed_timing.id
      response.should redirect_to(proposed_timings_url)
    end
  end

end