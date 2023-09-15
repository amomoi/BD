require "application_system_test_case"

class BdusuariosTest < ApplicationSystemTestCase
  setup do
    @bdusuario = bdusuarios(:one)
  end

  test "visiting the index" do
    visit bdusuarios_url
    assert_selector "h1", text: "Bdusuarios"
  end

  test "should create bdusuario" do
    visit bdusuarios_url
    click_on "New bdusuario"

    fill_in "Cpf", with: @bdusuario.CPF
    fill_in "Sms", with: @bdusuario.SMS
    fill_in "Ativo inativo", with: @bdusuario.ativo_inativo
    fill_in "Bdcliente", with: @bdusuario.bdcliente_id
    fill_in "Celular", with: @bdusuario.celular
    fill_in "Email", with: @bdusuario.email
    fill_in "Nome", with: @bdusuario.nome
    fill_in "Senha", with: @bdusuario.senha
    click_on "Create Bdusuario"

    assert_text "Bdusuario was successfully created"
    click_on "Back"
  end

  test "should update Bdusuario" do
    visit bdusuario_url(@bdusuario)
    click_on "Edit this bdusuario", match: :first

    fill_in "Cpf", with: @bdusuario.CPF
    fill_in "Sms", with: @bdusuario.SMS
    fill_in "Ativo inativo", with: @bdusuario.ativo_inativo
    fill_in "Bdcliente", with: @bdusuario.bdcliente_id
    fill_in "Celular", with: @bdusuario.celular
    fill_in "Email", with: @bdusuario.email
    fill_in "Nome", with: @bdusuario.nome
    fill_in "Senha", with: @bdusuario.senha
    click_on "Update Bdusuario"

    assert_text "Bdusuario was successfully updated"
    click_on "Back"
  end

  test "should destroy Bdusuario" do
    visit bdusuario_url(@bdusuario)
    click_on "Destroy this bdusuario", match: :first

    assert_text "Bdusuario was successfully destroyed"
  end
end
