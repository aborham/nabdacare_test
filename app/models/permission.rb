class Permission < ActiveRecord::Base

  validates :name, :level, presence: true
end
