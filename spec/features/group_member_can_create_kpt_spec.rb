require 'spec_helper'

feature 'グループメンバーは、イベントにKPTを記入出来る' do
  let(:group) { FactoryGirl.create(:group_event) }
  let(:event) { group.events.sample }

  context "ログインしている場合" do
    include_context 'ログインしている'

    context "グループメンバーである場合" do
      include_context 'グループメンバーである'

      background { visit group_event_path(group, event) }

      scenario 'KPTフォームが表示される' do
        page.should have_css "#new_kpt"
      end

      context "タイプと内容を入力し、追加をクリックすると" do
        before do
          select 'Keep', from: 'kpt[kpt_type]'
          fill_in "kpt[content]", with: "test kpt"
        end

        scenario 'KPTが追加される' do
          expect {
            click_button '追加'
          }.to change(Kpt, :count).by(1)
        end

        scenario 'KPTに表示される' do
          click_button '追加'

          within '#kpt' do
            page.should have_content 'test kpt'
          end
        end
      end

      context "内容が入力されない場合" do
        before do
          fill_in "kpt[content]", with: ""
        end

        scenario 'KPTは追加されない' do
          expect {
            click_button '追加'
          }.to_not change(Kpt, :count)
        end

        scenario '内容を入力してくださいメッセージが表示される' do
          click_button '追加'

          within '#kpt' do
            page.should have_content '内容を入力してください'
          end
        end
      end
    end

    context "グループメンバーではない場合" do
      scenario 'KPTフォームが表示されない' do
        visit group_event_path(group, event)

        page.should_not have_css '#new_kpt'
      end
    end
  end

  context "ログインしてない場合" do
    scenario 'KPTフォームが表示されない' do
      visit group_event_path(group, event)

      page.should_not have_css '#new_kpt'
    end
  end
end
