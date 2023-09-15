require "application_system_test_case"

class BdsensorsTest < ApplicationSystemTestCase
  setup do
    @bdsensor = bdsensors(:one)
  end

  test "visiting the index" do
    visit bdsensors_url
    assert_selector "h1", text: "Bdsensors"
  end

  test "should create bdsensor" do
    visit bdsensors_url
    click_on "New bdsensor"

    fill_in "Li", with: @bdsensor.LI
    fill_in "Ls", with: @bdsensor.LS
    fill_in "Arg1", with: @bdsensor.arg1
    fill_in "Arg2", with: @bdsensor.arg2
    fill_in "Arg3", with: @bdsensor.arg3
    fill_in "Arg4", with: @bdsensor.arg4
    fill_in "Arg5", with: @bdsensor.arg5
    fill_in "Ativo inativo", with: @bdsensor.ativo_inativo
    fill_in "Bdcliente", with: @bdsensor.bdcliente_id
    fill_in "Bdtipo", with: @bdsensor.bdtipo_id
    fill_in "Flag mantec", with: @bdsensor.flag_mantec
    fill_in "Flag notificacao", with: @bdsensor.flag_notificacao
    fill_in "Flag rearme", with: @bdsensor.flag_rearme
    fill_in "Nome sensor", with: @bdsensor.nome_sensor
    fill_in "Time read", with: @bdsensor.time_read
    click_on "Create Bdsensor"

    assert_text "Bdsensor was successfully created"
    click_on "Back"
  end

  test "should update Bdsensor" do
    visit bdsensor_url(@bdsensor)
    click_on "Edit this bdsensor", match: :first

    fill_in "Li", with: @bdsensor.LI
    fill_in "Ls", with: @bdsensor.LS
    fill_in "Arg1", with: @bdsensor.arg1
    fill_in "Arg2", with: @bdsensor.arg2
    fill_in "Arg3", with: @bdsensor.arg3
    fill_in "Arg4", with: @bdsensor.arg4
    fill_in "Arg5", with: @bdsensor.arg5
    fill_in "Ativo inativo", with: @bdsensor.ativo_inativo
    fill_in "Bdcliente", with: @bdsensor.bdcliente_id
    fill_in "Bdtipo", with: @bdsensor.bdtipo_id
    fill_in "Flag mantec", with: @bdsensor.flag_mantec
    fill_in "Flag notificacao", with: @bdsensor.flag_notificacao
    fill_in "Flag rearme", with: @bdsensor.flag_rearme
    fill_in "Nome sensor", with: @bdsensor.nome_sensor
    fill_in "Time read", with: @bdsensor.time_read
    click_on "Update Bdsensor"

    assert_text "Bdsensor was successfully updated"
    click_on "Back"
  end

  test "should destroy Bdsensor" do
    visit bdsensor_url(@bdsensor)
    click_on "Destroy this bdsensor", match: :first

    assert_text "Bdsensor was successfully destroyed"
  end
end
