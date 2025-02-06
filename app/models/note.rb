class Note < ApplicationRecord
  validates :name, presence: true
  scope :ordering, -> { order(id: :desc) }

end
