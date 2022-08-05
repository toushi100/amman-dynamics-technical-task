class Project < ApplicationRecord
    has_many :users, class_name: "user", foreign_key: "user_id"
end
