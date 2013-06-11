require 'spec_helper'

feature 'グループメンバーは、グループのイベントを編集出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  context "ログインしている場合" do
    background do
      OmniAuth.config.add_mock :twitter, tw_hash

      visit '/'
      click_link 'Twitterでログイン'
    end

    context "グループメンバーである場合" do
      background do
        visit group_path(group)
        click_link "参加"

        visit group_event_path(group, event)
      end

      scenario 'イベントページに編集リンクが表示される' do
        page.should have_link '編集'
      end

      context "編集リンクをクリックすると" do
        background { click_link '編集'}

        scenario 'イベント編集ページが表示される' do
          page.current_path == edit_group_event_path(group, event)
        end

        context "更新ボタンをクリックすると" do
          scenario '日付が更新される' do
            select "2012", from: "event[date(1i)]"
            click_button '更新'

            page.should have_content '2012'            
          end

          scenario '時間が更新される' do
            time = "13:30 ~ 15:30"
            fill_in "event[time]", with: time
            click_button '更新'

            page.should have_content time
          end

          scenario '内容が更新される' do
            content = "時間を30分前にズラした"
            fill_in "event[content]", with: content 
            click_button '更新'

            page.should have_content content 
          end

          context "時間が空の場合" do
            background do
              fill_in "event[time]", with: ""
              click_button '更新'
            end

            scenario 'イベントが更新されない' do
              curr_event = Event.find(event.id)
              curr_event.time.should == event.time
            end

            scenario '時間が必須入力のメッセージが表示される' do
              page.should have_content '時間を入力してください'
            end
          end
        end
      end
    end

    context "グループメンバーではない場合" do
      scenario '編集リンクが表示されない' do
        visit group_event_path(group, event)

        page.should_not have_link '編集'
      end
    end
  end

  context "ログインしてない場合" do
    scenario '編集リンクが表示されない' do
      visit group_event_path(group, event)

      page.should_not have_link '編集'
    end
  end
end

def tw_hash
  {
    provider: 'twitter',
    uid: '12345',
    info: {
      name: 'test_twitter_user',
      image: 'test.jpg'
    }
  }
end
