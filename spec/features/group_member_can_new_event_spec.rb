require 'spec_helper'

feature 'グループメンバーは、グループにイベント作成出来る' do
  let(:group) { FactoryGirl.create(:seq_group) }

  before do
    OmniAuth.config.add_mock :twitter, tw_hash

    visit '/'
    click_link 'Twitterでログイン'

    visit group_path(group)
    click_link "参加"
  end

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
        select '2013', from: 'event[date(1i)]'
        select '6', from: 'event[date(1i)]'
        select "10", from: "event[date(3i)]"
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
