class AddDescriptionAndImgToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :description, :text
    add_column :groups, :img_url, :string
  end
end
