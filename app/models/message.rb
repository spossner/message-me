class Message < ApplicationRecord
  default_scope { order(:created_at) }
  belongs_to :user
  validates :body, presence: true

  scope :newest, -> { order(:created_at).last(20) }
end
