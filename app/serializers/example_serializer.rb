# frozen_string_literal: true

class ExampleSerializer < ActiveModel::Serializer
  attributes :id, :text, :editable

# if the currernt sign in user can edit
  def editable
    scope == object.user
  end
end
