require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:first)
  end

  test "creating a new quote" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "New note"
    assert_selector "h1", text: "New note"

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
    assert_selector "h1", text: "Edit note"

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


end
