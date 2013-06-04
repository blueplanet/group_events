require 'spec_helper'

feature 'ゲストは、グループのイベント一覧を見える' do
  let(:group) { FactoryGirl.create(:seq_group) }

  before do
    10.times do
      group.events << FactoryGirl.create(:seq_event)
    end
  end

  context "グループページへアクセスすると" do
    scenario 'グループのイベント一覧が表示される' do
      visit group_path(group)

      group.events.each do |event|
        page.should have_content event.title
      end
    end
  end
end
