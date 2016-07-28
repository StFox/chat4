class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  paginates_per 15
end
