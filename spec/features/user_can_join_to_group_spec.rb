require 'spec_helper'

feature 'ユーザは、グループに参加出来る' do
  let(:group) { FactoryGirl.create(:seq_group) }

  before do
    OmniAuth.config.add_mock :twitter, tw_hash
    visit '/'
    click_link "Twitterでログイン"

    visit group_path(group)
  end 
 
  scenario '参加リンクが表示される' do
    page.should have_link "参加する"
  end

  scenario '参加リンクをクリックすると、グループメンバーに追加される' do
    expect {
      click_link "参加する"
    }.to change(GroupUser, :count).by(1)
  end

  scenario '参加リンクをクリックすると、グループメンバー一覧に表示される' do
    click_link "参加する"

    within "#members" do
      page.should have_content tw_hash[:info][:name]
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
