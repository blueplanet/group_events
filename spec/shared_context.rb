shared_context 'ログインしている' do
  before do  
    OmniAuth.config.add_mock :twitter, tw_hash

    visit '/'
    click_link 'Twitterでログイン'
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
end

shared_context 'グループメンバーである' do
  before do
    visit group_path(group)
    click_link "参加"
  end
end
