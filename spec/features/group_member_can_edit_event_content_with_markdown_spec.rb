require 'spec_helper'

feature 'グループメンバーは、Markdownでイベントの説明を書ける' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  include_context 'ログインしている'
  include_context 'グループメンバーである'

  scenario 'Markdownで書いて、保存すると、正しくHTMLに変換される' do
    visit edit_group_event_path(group, event)

    fill_in "event[content]", with: "# テストタイトル\n\n## サブタイトル"

    click_button '更新'

    within '#main' do
      page.should have_css 'h1', text: 'テストタイトル'
      page.should have_css 'h2', text: 'サブタイトル'
    end
  end
end
