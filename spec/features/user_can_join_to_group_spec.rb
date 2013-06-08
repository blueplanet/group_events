require 'spec_helper'

feature 'ユーザは、グループに参加出来る' do
  let(:group) { FactoryGirl.create(:seq_group) }
  let(:user) { FactoryGirl.create(:user) }

  before(:all) do
    OmniAuth.config.add_mock :twitter, tw_hash
    visit '/'
    click_link "Twitterでログイン"
  end 

  before { visit group_path(group) }
 
  scenario '参加リンクが表示される' do
    page.should have_link "参加する"
  end

  scenario '参加リンクをクリックすると、グループメンバーに表示される' do
    # click_link "参加する"

    # within("#members") do
    #   page.should have_link "#{user.name}"
    # end
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
