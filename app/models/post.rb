class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  scope :is_published, -> { where("is_draft = false") }
  scope :is_draft, -> { where("is_draft = true") }
end
