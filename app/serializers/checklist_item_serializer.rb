class ChecklistItemSerializer < ActiveModel::Serializer
  attributes :id, :priority, :text, :finished
end
