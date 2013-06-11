class CreateKpts < ActiveRecord::Migration
  def change
    create_table :kpts do |t|
      t.integer :kpt_type
      t.text :content
      t.references :event, index: true

      t.timestamps
    end
  end
end
