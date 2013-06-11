require 'spec_helper'

feature 'ユーザは、グループを作成出来る' do
  context "ログインしている場合" do
    before do
      OmniAuth.config.add_mock :twitter, tw_hash

      visit '/'
      click_link 'Twitterでログイン'

      visit groups_path
    end

    scenario 'グループ新規リンクが表示される' do
      page.should have_link 'グループ新規'
    end

    context "グループ新規リンクをクリックすると" do
      before { click_link 'グループ新規' }

      scenario 'グループ新規画面が表示される' do
        page.current_path.should == new_group_path
      end
    end
  end

  context "ログインしてない場合" do
    scenario 'グループ新規リンクが表示されない' do
      page.should_not have_link 'グループ新規'
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
