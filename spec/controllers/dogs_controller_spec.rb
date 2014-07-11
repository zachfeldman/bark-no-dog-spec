require 'rails_helper'

RSpec.describe DogsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Dog. As you add validations to Dog, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    @valid_attributes = {
      name: "Fluffy",
      email: "fluffster@aol.com",
      password: "testtest",
      password_confirmation: "testtest",
      birthday: Time.now-3.years,
      city: "New York",
      state: "NY",
      newsletter: true
    }
  }

  let(:invalid_attributes) {
    @invalid_attributes = {
      email: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DogsController. Be sure to keep this updated too.
  let(:valid_session) { {dog_id: 1} }

  describe "GET index" do
    it "assigns all dogs as @dogs" do
      dog = Dog.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dogs)).to eq([dog])
    end
  end

  describe "GET show" do
    it "assigns the requested dog as @dog" do
      dog = Dog.create! valid_attributes
      get :show, {:id => dog.to_param}, valid_session
      expect(assigns(:dog)).to eq(dog)
    end
  end

  describe "GET new" do
    it "assigns a new dog as @dog" do
      get :new, {}, valid_session
      expect(assigns(:dog)).to be_a_new(Dog)
    end
  end

  describe "GET edit" do
    it "assigns the requested dog as @dog" do
      dog = Dog.create! valid_attributes
      get :edit, {:id => dog.to_param}, valid_session
      expect(assigns(:dog)).to eq(dog)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Dog" do
        expect {
          post :create, {:dog => valid_attributes}, valid_session
        }.to change(Dog, :count).by(1)
      end

      it "assigns a newly created dog as @dog" do
        post :create, {:dog => valid_attributes}, valid_session
        expect(assigns(:dog)).to be_a(Dog)
        expect(assigns(:dog)).to be_persisted
      end

      it "redirects to the created dog" do
        post :create, {:dog => valid_attributes}, valid_session
        expect(response).to redirect_to(Dog.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dog as @dog" do
        post :create, {:dog => invalid_attributes}, valid_session
        expect(assigns(:dog)).to be_a_new(Dog)
      end

      it "re-renders the 'new' template" do
        post :create, {:dog => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        @valid_attributes = {
          name: "Fluffy",
          email: "fluffster12@aol.com",
          password: "testtest",
          password_confirmation: "testtest",
          birthday: Time.now-3.years,
          city: "New York",
          state: "NY",
          newsletter: true
        }
      }

      it "updates the requested dog" do
        dog = Dog.create! valid_attributes
        put :update, {:id => dog.to_param, :dog => new_attributes}, valid_session
        dog.reload
        expect(dog.email).to eq("fluffster12@aol.com")
      end

      it "assigns the requested dog as @dog" do
        dog = Dog.create! valid_attributes
        put :update, {:id => dog.to_param, :dog => valid_attributes}, valid_session
        expect(assigns(:dog)).to eq(dog)
      end

      it "redirects to the dog" do
        dog = Dog.create! valid_attributes
        put :update, {:id => dog.to_param, :dog => valid_attributes}, valid_session
        expect(response).to redirect_to(dog)
      end
    end

    describe "with invalid params" do
      it "assigns the dog as @dog" do
        dog = Dog.create! valid_attributes
        put :update, {:id => dog.to_param, :dog => invalid_attributes}, valid_session
        expect(assigns(:dog)).to eq(dog)
      end

      it "re-renders the 'edit' template" do
        dog = Dog.create! valid_attributes
        put :update, {:id => dog.to_param, :dog => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dog" do
      dog = Dog.create! valid_attributes
      expect {
        delete :destroy, {:id => dog.to_param}, valid_session
      }.to change(Dog, :count).by(-1)
    end

    it "redirects to the dogs list" do
      dog = Dog.create! valid_attributes
      delete :destroy, {:id => dog.to_param}, valid_session
      expect(response).to redirect_to(dogs_url)
    end
  end

end
