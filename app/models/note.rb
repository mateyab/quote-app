class Note < ApplicationRecord
  validates :name, presence: true
  scope :ordering, -> { order(id: :desc) }
  after_create_commit -> {broadcast_prepend_to "notes", partial: "notes/note", locals: {note: self}, target: "notes"}
  #execute every time a note is added to the database
  after_update_commit -> { broadcast_replace_to "notes"} #this is the same as above because of rails convention
  after_destroy_commit -> {broadcast_remove_to "notes"}

  belongs_to :company

end
