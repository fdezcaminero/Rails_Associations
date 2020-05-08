class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :invites, foreign_key: :attendee_id
    has_many :attended_events, through: :invites
end
