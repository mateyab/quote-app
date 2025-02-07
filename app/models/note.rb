class Note < ApplicationRecord
  validates :name, presence: true
  scope :ordering, -> { order(id: :desc) }
  broadcasts_to -> (note) { [note.company, "notes"]}, inserts_by: :prepend

  belongs_to :company

end
