require 'spec_helper'

describe Api::V1::PermissionsController do

  describe "GET #index" do
    before(:each) do
      @permission_1 = create :permission
      @permission_2 = create :permission
      @permission_3 = create :permission
    end
    context "when no user present" do
      before(:each) do
        get :index
      end
      it "returns 3 records from the database" do
        permissions_response = json_response
        expect(permissions_response).to have(3).items
      end

      it { should respond_with 200 }

    end

    context "where is a user present" do
      before(:each) do
        @user = create :user
        @user.permissions << @permission_1
        @user.permissions << @permission_2
        @user.permissions << @permission_3
        get :index, :user_id => @user.id
      end
      it "returns 3 records from the database" do
        permissions_response = json_response
        expect(permissions_response).to have(3).items
      end

      it { should respond_with 200 }

    end

  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @permission_attributes = FactoryGirl.attributes_for :permission
        post :create, { permission: @permission_attributes }, format: :json
      end

      it "renders the json representation for the permission record just created" do
        permission_response = json_response
        expect(permission_response[:name]).to eql @permission_attributes[:name]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        #notice I'm not including the email
        @invalid_permission_attributes = { level: 1}
        post :create, { permission: @invalid_permission_attributes },
             format: :json
      end

      it "renders an errors json" do
        permission_response = json_response
        expect(permission_response).to have_key(:errors)
      end

      it "renders the json errors on why the permission could not be created" do
        permission_response = json_response
        expect(permission_response[:errors][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

end
