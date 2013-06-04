require 'spec_helper'

feature 'ゲストは、グループイベントの詳細を見える' do
  let(:group) { FactoryGirl.create(:seq_group) }
  let(:event) do
    group.events << FactoryGirl.create(:seq_event)
    group.events.sample
  end

  context "イベントページにアクセスすると" do
    before { visit group_event_path(group, event)}

    scenario 'イベントタイトルが表示される' do
      page.should have_content event.title
    end 

    scenario 'イベント内容が表示される' do 
      page.should have_content event.content
    end

    scenario 'イベント場所が表示される' do
      page.should have_content event.location
    end 
  end
end
