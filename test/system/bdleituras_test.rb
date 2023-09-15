require "application_system_test_case"

class BdleiturasTest < ApplicationSystemTestCase
  setup do
    @bdleitura = bdleituras(:one)
  end

  test "visiting the index" do
    visit bdleituras_url
    assert_selector "h1", text: "Bdleituras"
  end

  test "should create bdleitura" do
    visit bdleituras_url
    click_on "New bdleitura"

    fill_in "Bdsensor", with: @bdleitura.bdsensor_id
    fill_in "Valor", with: @bdleitura.valor
    click_on "Create Bdleitura"

    assert_text "Bdleitura was successfully created"
    click_on "Back"
  end

  test "should update Bdleitura" do
    visit bdleitura_url(@bdleitura)
    click_on "Edit this bdleitura", match: :first

    fill_in "Bdsensor", with: @bdleitura.bdsensor_id
    fill_in "Valor", with: @bdleitura.valor
    click_on "Update Bdleitura"

    assert_text "Bdleitura was successfully updated"
    click_on "Back"
  end

  test "should destroy Bdleitura" do
    visit bdleitura_url(@bdleitura)
    click_on "Destroy this bdleitura", match: :first

    assert_text "Bdleitura was successfully destroyed"
  end
end
