class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  acts_as_readable :on => :created_at
  belongs_to :user
end
