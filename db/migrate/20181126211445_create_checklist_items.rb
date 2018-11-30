class CreateChecklistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_items do |t|
      t.integer :priority
      t.text :text
      t.boolean :finished
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
