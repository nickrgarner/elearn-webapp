require "application_system_test_case"

class DisciplinesTest < ApplicationSystemTestCase
  setup do
    @discipline = disciplines(:one)
  end

  test "visiting the index" do
    visit disciplines_url
    assert_selector "h1", text: "Disciplines"
  end

  test "creating a Discipline" do
    visit disciplines_url
    click_on "New Discipline"

    click_on "Create Discipline"

    assert_text "Discipline was successfully created"
    click_on "Back"
  end

  test "updating a Discipline" do
    visit disciplines_url
    click_on "Edit", match: :first

    click_on "Update Discipline"

    assert_text "Discipline was successfully updated"
    click_on "Back"
  end

  test "destroying a Discipline" do
    visit disciplines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discipline was successfully destroyed"
  end
end
