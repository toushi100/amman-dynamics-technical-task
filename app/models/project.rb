class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tickets, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
