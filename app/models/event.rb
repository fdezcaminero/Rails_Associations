require 'date'

class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    has_many :invites, foreign_key: 'attended_event_id'
    has_many :attendees, through: :invites

    scope :past , -> { where("day < date('now')  ") }
    scope :upcoming , -> { where("day >= date('now')  ") }
end
