class Ticket < ApplicationRecord
  belongs_to :project

  OPTIONS = ["ToDo", "InProgress", "Done"]

  validates_inclusion_of :status, :in => OPTIONS
end
