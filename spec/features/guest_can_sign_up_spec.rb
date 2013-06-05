require 'spec_helper'

feature 'ゲストは、サインアップ出来る' do

  before do
    OmniAuth.config.add_mock :twitter, tw_hash
    visit root_path
  end 

  scenario 'Topページにアクセスすると、Twitterでログインリンクが表示される' do
    page.should have_link 'Twitterでログイン'
  end

  context 'Twitterでログインリンクをクリックすると' do
    context "登録してなかった場合" do
      scenario 'ユーザが１つ作成される'
    end

    context "登録した場合" do
      scenario 'ユーザが追加されない'
    end

    context "ログインが成功した場合" do
      before { click_link "Twitterでログイン"}

      scenario 'ユーザ名称が表示される' do
        page.should have_content tw_hash[:name]
      end
      scenario 'ユーザのアイコンが表示される'
    end
  end
end

def tw_hash
  {
    provider: 'twitter',
    uid: '12345',
    info: {
      name: 'test_twitter_user'
    }
  }
end
