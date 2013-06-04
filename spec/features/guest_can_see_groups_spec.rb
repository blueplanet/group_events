require 'spec_helper'

feature 'ゲストは、グループ一覧を見える' do
  background do
    10.times do
      FactoryGirl.create(:seq_group)
    end
  end

  context "/groupsにアクセスすると" do
    background { visit groups_path }

    scenario 'グループ一覧が表示される' do
      page.should have_content 'グループ一覧'
    end

    scenario '各グループの名称が表示される' do
      Group.all.each do |group|
        page.should have_content group.name
      end
    end

    scenario 'グループ名称をクリックすると、グループ詳細へ遷移される' do
      group = Group.all.sample

      click_link "#{group.name}"
      page.current_path.should == group_path(group)
    end
  end
end
