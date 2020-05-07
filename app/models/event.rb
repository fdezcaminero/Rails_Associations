class Event < ApplicationRecord
  #belongs_to :creator, class_name: "User"
  #belongs_to :user, foreign_key: :user_id, class_name: "User"

  belongs_to :user
end
