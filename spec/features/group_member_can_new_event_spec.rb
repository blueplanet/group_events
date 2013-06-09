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
