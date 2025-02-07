class AddCompanyReferenceToNotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :notes, :company, null: false, foreign_key: true
  end
end
