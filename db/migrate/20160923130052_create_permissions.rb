class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
