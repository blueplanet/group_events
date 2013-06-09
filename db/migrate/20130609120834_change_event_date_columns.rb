class ChangeEventDateColumns < ActiveRecord::Migration
  def change
    remove_column :events, :start_at
    remove_column :events, :end_at

    add_column :events, :date, :datetime
    add_column :events, :time, :string
  end
end
