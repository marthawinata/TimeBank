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

describe BoardgamesController do

  # This should return the minimal set of attributes required to create a valid
  # Boardgame. As you add validations to Boardgame, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all boardgames as @boardgames" do
      boardgame = Boardgame.create! valid_attributes
      get :index
      assigns(:boardgames).should eq([boardgame])
    end
  end

  describe "GET show" do
    it "assigns the requested boardgame as @boardgame" do
      boardgame = Boardgame.create! valid_attributes
      get :show, :id => boardgame.id
      assigns(:boardgame).should eq(boardgame)
    end
  end

  describe "GET new" do
    it "assigns a new boardgame as @boardgame" do
      get :new
      assigns(:boardgame).should be_a_new(Boardgame)
    end
  end

  describe "GET edit" do
    it "assigns the requested boardgame as @boardgame" do
      boardgame = Boardgame.create! valid_attributes
      get :edit, :id => boardgame.id
      assigns(:boardgame).should eq(boardgame)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Boardgame" do
        expect {
          post :create, :boardgame => valid_attributes
        }.to change(Boardgame, :count).by(1)
      end

      it "assigns a newly created boardgame as @boardgame" do
        post :create, :boardgame => valid_attributes
        assigns(:boardgame).should be_a(Boardgame)
        assigns(:boardgame).should be_persisted
      end

      it "redirects to the created boardgame" do
        post :create, :boardgame => valid_attributes
        response.should redirect_to(Boardgame.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved boardgame as @boardgame" do
        # Trigger the behavior that occurs when invalid params are submitted
        Boardgame.any_instance.stub(:save).and_return(false)
        post :create, :boardgame => {}
        assigns(:boardgame).should be_a_new(Boardgame)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Boardgame.any_instance.stub(:save).and_return(false)
        post :create, :boardgame => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested boardgame" do
        boardgame = Boardgame.create! valid_attributes
        # Assuming there are no other boardgames in the database, this
        # specifies that the Boardgame created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Boardgame.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => boardgame.id, :boardgame => {'these' => 'params'}
      end

      it "assigns the requested boardgame as @boardgame" do
        boardgame = Boardgame.create! valid_attributes
        put :update, :id => boardgame.id, :boardgame => valid_attributes
        assigns(:boardgame).should eq(boardgame)
      end

      it "redirects to the boardgame" do
        boardgame = Boardgame.create! valid_attributes
        put :update, :id => boardgame.id, :boardgame => valid_attributes
        response.should redirect_to(boardgame)
      end
    end

    describe "with invalid params" do
      it "assigns the boardgame as @boardgame" do
        boardgame = Boardgame.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Boardgame.any_instance.stub(:save).and_return(false)
        put :update, :id => boardgame.id, :boardgame => {}
        assigns(:boardgame).should eq(boardgame)
      end

      it "re-renders the 'edit' template" do
        boardgame = Boardgame.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Boardgame.any_instance.stub(:save).and_return(false)
        put :update, :id => boardgame.id, :boardgame => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested boardgame" do
      boardgame = Boardgame.create! valid_attributes
      expect {
        delete :destroy, :id => boardgame.id
      }.to change(Boardgame, :count).by(-1)
    end

    it "redirects to the boardgames list" do
      boardgame = Boardgame.create! valid_attributes
      delete :destroy, :id => boardgame.id
      response.should redirect_to(boardgames_url)
    end
  end

end
