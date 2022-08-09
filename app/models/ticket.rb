class Ticket < ApplicationRecord
  belongs_to :project
  has_many_attached :attachment, dependent: :destroy

  OPTIONS = ["ToDo", "InProgress", "Done"]

  validates_inclusion_of :status, :in => OPTIONS
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :due_date, presence: true
end
