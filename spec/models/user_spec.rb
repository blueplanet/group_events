require 'spec_helper'

describe User do
  describe "#create_with_omniauth" do
    it "ユーザが１つ作成される" do
      expect {
        User.create_with_omniauth auth
      }.to change(User, :count).by(1)
    end

    it "ユーザのUIDが保存される" do
      User.create_with_omniauth auth

      User.last.uid.should == auth[:uid]
    end

    it "ユーザ名称が保存される" do
      User.create_with_omniauth auth

      User.last.name.should == auth[:info][:name]
    end

    it "ユーザイメージURLが保存されふ" do
      User.create_with_omniauth auth

      User.last.img_url.should == auth[:info][:image]
    end
  end

  describe "#groups" do
    let(:group) { FactoryGirl.create(:seq_group) }
    let(:user) { FactoryGirl.create(:user) }

    it "ユーザのグループに追加すると、GroupUserが１つ作成される" do
      expect {
        user.groups << group
      }.to change(GroupUser, :count).by(1)

    end
  end
end

def auth
  {
    provider: 'twitter',
    uid: '12345',
    name: 'test',
    info: {
      name: 'test_twitter_user',
      image: 'http://test.com/test.jpg'
    }
  }
end
