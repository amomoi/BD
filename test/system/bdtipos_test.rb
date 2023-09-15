require "application_system_test_case"

class BdtiposTest < ApplicationSystemTestCase
  setup do
    @bdtipo = bdtipos(:one)
  end

  test "visiting the index" do
    visit bdtipos_url
    assert_selector "h1", text: "Bdtipos"
  end

  test "should create bdtipo" do
    visit bdtipos_url
    click_on "New bdtipo"

    fill_in "Tipo sensor", with: @bdtipo.tipo_sensor
    click_on "Create Bdtipo"

    assert_text "Bdtipo was successfully created"
    click_on "Back"
  end

  test "should update Bdtipo" do
    visit bdtipo_url(@bdtipo)
    click_on "Edit this bdtipo", match: :first

    fill_in "Tipo sensor", with: @bdtipo.tipo_sensor
    click_on "Update Bdtipo"

    assert_text "Bdtipo was successfully updated"
    click_on "Back"
  end

  test "should destroy Bdtipo" do
    visit bdtipo_url(@bdtipo)
    click_on "Destroy this bdtipo", match: :first

    assert_text "Bdtipo was successfully destroyed"
  end
end
