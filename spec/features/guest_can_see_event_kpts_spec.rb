require 'spec_helper'

feature 'ゲストは、イベントのKPTを確認出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  background { visit group_event_path(group, event) }

  scenario 'イベントのKeepが表示される' do
    within '#kpt' do
      page.should have_content 'Keep'
    end
  end
end
