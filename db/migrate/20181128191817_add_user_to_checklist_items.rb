class AddUserToChecklistItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :checklist_items, :user, foreign_key: true
  end
end
