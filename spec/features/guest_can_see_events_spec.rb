require 'spec_helper'

feature 'ゲストは、グループのイベント一覧を見える' do
  let(:group) { FactoryGirl.create(:seq_group) }

  before do
    10.times do
      group.events << FactoryGirl.create(:seq_event)
    end
  end

  context "グループページへアクセスすると" do
    before do
      visit group_path(group)
    end

    scenario 'グループのイベント一覧が表示される' do
      group.events.each do |event|
        page.should have_content event.title
      end
    end

    scenario 'あるイベントのタイトルをクリックすると、イベントページへ遷移される' do
      event = group.events.sample
      click_link "#{event.title}"

      page.current_path.should == group_event_path(group, event)
    end
  end
end
