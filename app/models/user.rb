# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :checklist_items
end
