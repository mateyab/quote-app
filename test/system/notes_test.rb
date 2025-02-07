require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @note = Note.ordering.first
  end

  test "creating a new quote" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "New note"
    fill_in "Name", with: "Capybara note"
    click_on "Create note"
    
    assert_selector "h1", text: "Notes"
    assert_text "Capybara note"

  end

  test "Showing a note" do
    visit notes_path
    click_link @note.name
    assert_selector "h1", text: @note.name

  end

  test "Updating a note" do
    visit notes_path
    assert_selector 'h1', text: "Notes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated note"
    click_on "Update note"

    assert_selector "h1", text: "Notes"
    assert_text "Updated note"
  end

  test "Destroying a note" do
    visit notes_path
    assert_text @note.name

    click_on "Delete", match: :first
    assert_no_text @note.name
  end

  test "Cancelling a note edit" do 
    visit notes_path
    assert_selector 'h1', text: "Notes"

    click_on "Edit", match: :first
    click_on "Cancel"

    assert_selector "h1", text: "Notes"
    assert_text "First note"
  end


end
