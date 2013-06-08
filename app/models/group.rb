class Group < ActiveRecord::Base

  has_many :events
  has_many :group_users
  has_many :members, :through => :group_users, source: :user
end
