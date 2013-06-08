class Group < ActiveRecord::Base

  has_many :events
  has_many :members, :class_name => "User", :foreign_key => "group_id"
end
