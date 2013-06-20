require 'spec_helper'

shared_examples_for '削除権限なし' do
  scenario '削除リンクが表示されない' do
    visit group_event_path(group, event)

    within '#kpts' do
      page.should_not have_link 'x'
    end
  end
end

feature 'グループメンバーは、KPTを削除出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  before do
    3.times do |n|
      event.keeps.create content: "keep #{n}"
    end
  end

  context "ログインしている場合" do
    include_context 'ログインしている'

    context "グループメンバーである場合" do
      include_context 'グループメンバーである'

      before { visit group_event_path(group, event) }

      scenario 'イベントページのKPTに削除リンクが表示される' do
        within '#kpts' do
          page.should have_link 'x'
        end
      end

      scenario '削除リンクをクリックすると、そのKPTが削除される' do
        expect {
          first(:link, 'x').click
        }.to change(Kpt, :count).by(-1)
      end
    end

    context "グループメンバーではない場合" do
      it_behaves_like '削除権限なし'
    end
  end

  context "ログインしてない場合" do
    it_behaves_like '削除権限なし'
  end
end

