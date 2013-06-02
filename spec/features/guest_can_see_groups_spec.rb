require 'spec_helper'

feature 'ゲストは、グループ一覧を見える' do
  scenario '/groupsにアクセスすると、グループ一覧が表示される' do
    visit groups_path

    page.should have_content 'グループ一覧'
  end
end
