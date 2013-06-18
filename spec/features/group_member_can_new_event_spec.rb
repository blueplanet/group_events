require 'spec_helper'

feature 'グループメンバーは、グループにイベント作成出来る' do
  let(:group) { FactoryGirl.create(:seq_group) }

  include_context 'ログインしている'
  include_context 'グループメンバーである'

  scenario 'イベント新規リンクが表示される' do
    page.should have_content 'イベント新規'
  end

  context "イベント新規リンクをクリックすると" do
    before { click_link "イベント新規" }

    scenario 'イベント新規画面が表示される' do
      page.current_path.should == new_group_event_path(group)
    end

    context "日付と時間を入力し、新規ボタンをクリックすると" do
      before do
        fill_in "event[date]", with: "2013-6-10"
        fill_in "event[time]", with: "14:00 - 16:00"
      end

      scenario 'イベントが新規される' do
        expect {
          click_button '新規作成'
        }.to change(Event, :count).by(1)
      end

      scenario 'イベントページにリダイレクトされる' do
        click_button '新規作成'

        page.current_path.should == group_event_path(group, group.events.last)
      end
    end

    context "時間が入力されてない場合" do
      before { fill_in "event[time]", with: "" }
          
      scenario 'イベントが保存されない' do
        expect {
          click_button "新規"
        }.to change(Event, :count).by(0)
      end

      scenario '必須入力メッセージが表示される' do
        click_button "新規"

        page.should have_content '時間を入力してください'
      end
    end
  end
end

