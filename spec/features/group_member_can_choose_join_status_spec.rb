require 'spec_helper'

feature 'グループメンバーは、イベントの参加状況を選択出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  before do
    event.participants << FactoryGirl.create_list(:seq_user, 4)
    event.absentees << FactoryGirl.create_list(:seq_user, 5)
    event.subtles << FactoryGirl.create_list(:seq_user, 3)

    visit group_event_path(group, event)
  end

  scenario 'イベントの参加メンバー一覧が表示される' do
    within "#participants" do
      event.participants.each do |user|
        page.should have_content user.name
      end
    end
  end

  scenario 'イベントの欠席メンバー一覧が表示される' do
    within '#absentees' do
      event.absentees.each do |user|
        page.should have_content user.name
      end
    end
  end

  scenario 'イベントの微妙のメンバー一覧が表示される' do
    within '#subtles' do
      event.subtles.each do |user|
        page.should have_content user.name
      end
    end
  end

  context "グループメンバーの場合" do
    # before { group.members << user }
    # scenario 'イベントページに参加状態を選択するリンクが表示される' do
    #   visit 
    # end
  end
end
