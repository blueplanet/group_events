require 'spec_helper'

feature 'ゲストは、イベントのKPTを確認出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  background do
    10.times { event.keeps << FactoryGirl.create(:seq_keep) }
    5.times { event.problems << FactoryGirl.create(:seq_problem) }
    7.times { event.trys << FactoryGirl.create(:seq_try) }

    visit group_event_path(group, event)
  end 

  scenario 'イベントのKeepが表示される' do
    within '#keep' do
      event.keeps.each do |keep|
        page.should have_content keep.content
      end
    end
  end

  scenario 'イベントのProblemが表示される' do
    within '#problem' do
      event.problems.each do |problem|
        page.should have_content problem.content
      end
    end
  end

  scenario 'イベントのTryが表示される' do
    within '#try' do
      event.trys.each do |try|
        page.should have_content try.content
      end
    end
  end
end
