class Ticket < ApplicationRecord
  belongs_to :project
  has_many_attached :attachment, dependent: :destroy

  OPTIONS = ["ToDo", "InProgress", "Done"]

  validates_inclusion_of :status, :in => OPTIONS
end