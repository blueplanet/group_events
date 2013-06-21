require 'spec_helper'

feature 'ユーザは、ログアウト出来る' do
  include_context 'ログインしている'

  before { visit root_path }

  scenario 'ログアウトリンクが表示される' do
    page.should have_link 'ログアウト'
  end

  context "ログアウトリンクをクリックすると" do
    before { click_link 'ログアウト' }

    scenario 'ログアウトリンクが表示されない' do
      page.should_not have_link 'ログアウト'
    end

    scenario 'Twitterでログインリンクが表示される' do
      page.should have_link 'Twitterでログイン'
    end
  end
end
