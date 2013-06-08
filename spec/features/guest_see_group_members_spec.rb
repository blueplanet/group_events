require 'spec_helper'

feature 'ゲストは、グループのメンバー一覧を見える' do
  let(:group) { FactoryGirl.create(:seq_group) }

  before do
    10.times do |i|
      group.members.create name: "user #{i}", img_url: "icon_#{i}.jpg"
    end

    visit group_path(group)
  end 

  scenario 'グループメンバーの名称が表示される' do
    group.members.each do |member|
      page.should have_content member.name
    end
  end

  scenario 'グループメンバーのアイコンが表示される' do
    group.members.each do |member|
      page.should have_css "img[src='#{member.img_url}']"
    end
  end
end
