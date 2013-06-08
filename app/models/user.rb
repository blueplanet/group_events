class User < ActiveRecord::Base
  has_many :group_users
  has_many :group, through: :group_users

  def self.create_with_omniauth(auth)
    create do |user|
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
      user.img_url = auth[:info][:image]
    end
  end
end
