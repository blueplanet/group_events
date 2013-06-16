require 'spec_helper'

feature 'グループメンバーは、イベントの参加状況を選択出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  include_context 'ログインしている'

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
    include_context 'グループメンバーである'
    before { visit group_event_path(group, event) }

    scenario 'イベントページに参加リンクが表示される' do
      page.should have_link '参加'
    end

    context "参加リンクをクリックすると" do
      before { click_link "参加" }

      scenario 'イベントページにリダイレクトされる' do
        page.current_path.should == group_event_path(group, event)
      end

      scenario '参加メンバー一覧に表示される' do
        within '#participants' do
          page.should have_content tw_hash[:info][:name]
        end
      end
    end

    scenario 'イベントページに欠席リンクが表示される' do
      page.should have_link '欠席'
    end

    context "欠席リンクをクリックすると" do
      before { click_link "欠席" }

      scenario 'イベントページにダイレクトされる' do
        page.current_path.should == group_event_path(group, event)
      end

      scenario '欠席メンバー一覧に表示される' do
        within '#absentees' do
          page.should have_content tw_hash[:info][:name]
        end
      end
    end

    scenario 'イベントページに微妙リンクが表示される' do
      page.should have_link '微妙'
    end

    context "微妙リンクをクリックすると" do
      before { click_link '微妙' }

      scenario 'イベントページにリダイレクトされる' do
        page.current_path.should == group_event_path(group, event)
      end

      scenario '微妙な者一覧に表示される' do
        within '#subtles' do
          page.should have_content tw_hash[:info][:name]
        end
      end
    end
  end
end
