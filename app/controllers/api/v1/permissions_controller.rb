class Api::V1::PermissionsController < ApplicationController
respond_to :json

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
