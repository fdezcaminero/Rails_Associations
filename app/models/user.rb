class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :events, foreign_key: :event_id, class_name: "Event"
end
