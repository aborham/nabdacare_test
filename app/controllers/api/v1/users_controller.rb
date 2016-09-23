class Api::V1::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      if params[:permissions]
        params[:permissions].each do |permission_id|
          permission = Permission.find(permission_id)
          user.permissions <<  permission
        end
      end
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :parent_id, :permissions => [])
  end

end
