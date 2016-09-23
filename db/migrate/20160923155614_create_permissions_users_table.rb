class CreatePermissionsUsersTable < ActiveRecord::Migration
  def change
    create_table :permissions_users do |t|
      t.references :user, index: true
      t.references :permission, index: true
    end
  end
end
