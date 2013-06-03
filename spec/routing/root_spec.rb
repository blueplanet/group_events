require 'spec_helper'

describe "root_path" do
  it "グループ一覧ページへルートされる" do
    { :get => '/'}.should route_to controller: 'groups', action: 'index'
  end
end
