require "application_system_test_case"

class BdclientesTest < ApplicationSystemTestCase
  setup do
    @bdcliente = bdclientes(:one)
  end

  test "visiting the index" do
    visit bdclientes_url
    assert_selector "h1", text: "Bdclientes"
  end

  test "should create bdcliente" do
    visit bdclientes_url
    click_on "New bdcliente"

    fill_in "Ativo inativo", with: @bdcliente.ativo_inativo
    fill_in "Nome empresa", with: @bdcliente.nome_empresa
    fill_in "Site", with: @bdcliente.site
    click_on "Create Bdcliente"

    assert_text "Bdcliente was successfully created"
    click_on "Back"
  end

  test "should update Bdcliente" do
    visit bdcliente_url(@bdcliente)
    click_on "Edit this bdcliente", match: :first

    fill_in "Ativo inativo", with: @bdcliente.ativo_inativo
    fill_in "Nome empresa", with: @bdcliente.nome_empresa
    fill_in "Site", with: @bdcliente.site
    click_on "Update Bdcliente"

    assert_text "Bdcliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Bdcliente" do
    visit bdcliente_url(@bdcliente)
    click_on "Destroy this bdcliente", match: :first

    assert_text "Bdcliente was successfully destroyed"
  end
end
