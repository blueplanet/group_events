require 'spec_helper'

feature 'ゲストは、グループ詳細を見える' do
  let(:group) { FactoryGirl.create(:seq_group) } 

  context "グループ詳細ページにアクセスすると" do
    background { visit group_path(group)}

    scenario 'グループ名称が表示される' do
      page.should have_content group.name
    end

    scenario 'グループ説明が表示される' do
      page.should have_content group.description
    end

    scenario 'グループのイメージが表示される' do
      page.should have_css "img[src='#{group.img_url}']"
    end
  end
end
