require 'spec_helper'

feature 'ゲストは、グループ詳細を見える' do
  let(:group) { FactoryGirl.create(:seq_group) } 

  context "グループ詳細ページにアクセスすると" do
    background { visit group_path(group)}

    scenario 'グループ名称が表示される' do
      page.should have_content group.name
    end
  end
end
