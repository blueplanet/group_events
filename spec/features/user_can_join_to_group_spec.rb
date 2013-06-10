require 'spec_helper'

feature 'ユーザは、グループに参加出来る' do
  let(:group) { FactoryGirl.create(:seq_group) }

  context "ログインしてない場合" do
    scenario '参加リンクが表示されない' do
      visit group_path(group)

      page.should_not have_link "参加する"
    end
  end

  context "ログインしている場合" do
    before do
      OmniAuth.config.add_mock :twitter, tw_hash
      visit '/'
      click_link "Twitterでログイン"
    end

    context "グループメンバーではない場合" do
      before { visit group_path(group) }

      scenario '参加リンクが表示される' do
        page.should have_link "参加する"
      end

      scenario '参加リンクをクリックすると、グループメンバーに追加される' do
        expect {
          click_link "参加する"
        }.to change(GroupUser, :count).by(1)
      end

      context "参加するリンクをクリックすると" do
        before { click_link "参加する" }

        scenario 'グループメンバー一覧に表示される' do
          within "#members" do
            page.should have_content tw_hash[:info][:name]
          end
        end

        scenario '参加するリンクが表示されなくなる' do
          page.should_not have_link '参加する'
        end
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
