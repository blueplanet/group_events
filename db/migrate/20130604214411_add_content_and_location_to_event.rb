class AddContentAndLocationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :content, :text
    add_column :events, :location, :string
  end
end
