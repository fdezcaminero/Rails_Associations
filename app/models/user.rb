class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :events
end
