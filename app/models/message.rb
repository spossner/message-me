class Message < ApplicationRecord
  default_scope { order('created_at') }
  belongs_to :user
  validates :body, presence: true
end
