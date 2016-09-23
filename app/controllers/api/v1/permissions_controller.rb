class Api::V1::PermissionsController < ApplicationController
respond_to :json

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      respond_with user.permissions
    else
      respond_with Permission.all
    end
  end

  def create
    permission = Permission.new(permission_params)
    if permission.save
      render json: permission, status: 201
    else
      render json: { errors: permission.errors }, status: 422
    end
  end

  private

  def permission_params
    params.require(:permission).permit(:name, :level)
  end
end
