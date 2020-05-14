class Invite < ApplicationRecord
  validates :attendee_id, presence: true
  validates :attended_event_id, presence: true

  belongs_to :attendee, class_name: 'User', foreign_key: :attendee_id
  belongs_to :attended_event, class_name: 'Event', foreign_key: :attended_event_id
end
