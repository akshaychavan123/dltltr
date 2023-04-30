require "application_system_test_case"

class PapasTest < ApplicationSystemTestCase
  setup do
    @papa = papas(:one)
  end

  test "visiting the index" do
    visit papas_url
    assert_selector "h1", text: "Papas"
  end

  test "should create papa" do
    visit papas_url
    click_on "New papa"

    fill_in "Name", with: @papa.name
    click_on "Create Papa"

    assert_text "Papa was successfully created"
    click_on "Back"
  end

  test "should update Papa" do
    visit papa_url(@papa)
    click_on "Edit this papa", match: :first

    fill_in "Name", with: @papa.name
    click_on "Update Papa"

    assert_text "Papa was successfully updated"
    click_on "Back"
  end

  test "should destroy Papa" do
    visit papa_url(@papa)
    click_on "Destroy this papa", match: :first

    assert_text "Papa was successfully destroyed"
  end
end
