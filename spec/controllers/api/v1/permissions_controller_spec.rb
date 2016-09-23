require 'spec_helper'

describe Api::V1::PermissionsController do

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
