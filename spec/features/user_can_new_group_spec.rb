require 'spec_helper'

feature 'ユーザは、グループを作成出来る' do
  context "ログインしている場合" do
    include_context 'ログインしている' 
    before { visit groups_path }

    scenario 'グループ新規リンクが表示される' do
      page.should have_link 'グループ新規'
    end

    context "グループ新規リンクをクリックすると" do
      before { click_link 'グループ新規' }

      scenario 'グループ新規画面が表示される' do
        page.current_path.should == new_group_path
      end

      context "名称と説明を入力し、新規ボタンをクリックすると" do
        before do
          fill_in "group[name]", with: "テストグループ"
          fill_in "group[description]", with: "グループ説明。。。。"
        end

        scenario 'グループが新規される' do
          expect {
            click_button '新規'
          }.to change(Group, :count).by(1)
        end

        scenario 'グループ詳細画面が表示される' do
          click_button '新規'

          page.current_path.should == group_path(Group.last)
        end
      end

      context "名称が入力されてない場合" do
        before do 
          fill_in "group[name]", with: ""
          fill_in "group[description]", with: "テスト説明"
        end

        scenario 'グループが新規されない' do
          expect {
            click_button '新規'
          }.to_not change(Group, :count)
        end

        scenario '名称を入力してくださいメッセージが表示される' do
          click_button '新規'

          page.should have_content '名称を入力してください'
        end
      end

      context "名称が既に存在している場合" do
        before do
          name = 'test group'
          Group.create name: name

          fill_in "group[name]", with: name
        end

        scenario 'グループが新規されない' do
          expect {
            click_button '新規'
          }.to_not change(Group, :count)
        end

        scenario '名称は既に使われているメッセージが表示される' do
          click_button '新規'

          page.should have_content '名称は既に使われています'
        end
      end
    end
  end

  context "ログインしてない場合" do
    scenario 'グループ新規リンクが表示されない' do
      page.should_not have_link 'グループ新規'
    end
  end
end
