require 'spec_helper'

describe Group do
  describe "#members" do
    let(:group) { FactoryGirl.create(:seq_group) }
    let(:user) { FactoryGirl.create(:user) }

    it "グループのメンバーに追加すると、GroupUserが１つ作成される" do
      expect {
        group.members << user
      }.to change(GroupUser, :count).by(1)
    end
  end
end
