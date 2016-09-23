class User < ActiveRecord::Base
  belongs_to :parent, class_name: 'User'
  has_many :children, class_name: "User", foreign_key: :parent_id
  validates :name, :email ,presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def parent_name
    # it may not have a parent
    parent.try(:name)
  end

  def has_parent?
    parent.present?
  end

  def has_children?
    children.exists?
  end

end
