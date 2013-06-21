require 'spec_helper'

feature 'グループメンバーは、参加状況を編集出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  include_context 'ログインしている'
  include_context 'グループメンバーである'

  before { visit group_event_path(group, event) }

  context "参加している場合" do
    background { click_link '参加' }

    scenario '欠席と微妙リンクが表示される' do
      page.should have_css "a[disabled]", text: '参加'
      page.should have_link '欠席'
      page.should have_link '微妙'
    end
  end

  context "欠席している場合" do
    background { click_link '欠席'}

    scenario '参加と微妙リンクが表示される' do
      page.should have_link '参加'
      page.should have_css "a[disabled]", text: '欠席'
      page.should have_link '微妙'
    end
  end

  context "微妙の場合" do
    background { click_link '微妙' }

    scenario '参加と欠席リンクが表示される' do
      page.should have_link '参加'
      page.should have_link '欠席'
      page.should have_css "a[disabled]", text: '微妙'
    end
  end
end
