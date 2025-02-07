class Company < ApplicationRecord
  validates :name, presence: true
  has_many :users, dependent: :destroy
  has_many :notes, dependent: :destroy
end
