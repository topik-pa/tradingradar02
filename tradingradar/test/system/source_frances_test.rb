require "application_system_test_case"

class SourceFrancesTest < ApplicationSystemTestCase
  setup do
    @source_france = source_frances(:one)
  end

  test "visiting the index" do
    visit source_frances_url
    assert_selector "h1", text: "Source Frances"
  end

  test "creating a Source france" do
    visit source_frances_url
    click_on "New Source France"

    fill_in "Cod 0", with: @source_france.cod_0
    fill_in "Cod 1", with: @source_france.cod_1
    fill_in "Cod 10", with: @source_france.cod_10
    fill_in "Cod 11", with: @source_france.cod_11
    fill_in "Cod 2", with: @source_france.cod_2
    fill_in "Cod 3", with: @source_france.cod_3
    fill_in "Cod 4", with: @source_france.cod_4
    fill_in "Cod 5", with: @source_france.cod_5
    fill_in "Cod 6", with: @source_france.cod_6
    fill_in "Cod 7", with: @source_france.cod_7
    fill_in "Cod 8", with: @source_france.cod_8
    fill_in "Cod 9", with: @source_france.cod_9
    fill_in "Isin", with: @source_france.isin
    fill_in "Name", with: @source_france.name
    fill_in "Url 0", with: @source_france.url_0
    fill_in "Url 1", with: @source_france.url_1
    fill_in "Url 10", with: @source_france.url_10
    fill_in "Url 11", with: @source_france.url_11
    fill_in "Url 2", with: @source_france.url_2
    fill_in "Url 3", with: @source_france.url_3
    fill_in "Url 4", with: @source_france.url_4
    fill_in "Url 5", with: @source_france.url_5
    fill_in "Url 6", with: @source_france.url_6
    fill_in "Url 7", with: @source_france.url_7
    fill_in "Url 8", with: @source_france.url_8
    fill_in "Url 9", with: @source_france.url_9
    click_on "Create Source france"

    assert_text "Source france was successfully created"
    click_on "Back"
  end

  test "updating a Source france" do
    visit source_frances_url
    click_on "Edit", match: :first

    fill_in "Cod 0", with: @source_france.cod_0
    fill_in "Cod 1", with: @source_france.cod_1
    fill_in "Cod 10", with: @source_france.cod_10
    fill_in "Cod 11", with: @source_france.cod_11
    fill_in "Cod 2", with: @source_france.cod_2
    fill_in "Cod 3", with: @source_france.cod_3
    fill_in "Cod 4", with: @source_france.cod_4
    fill_in "Cod 5", with: @source_france.cod_5
    fill_in "Cod 6", with: @source_france.cod_6
    fill_in "Cod 7", with: @source_france.cod_7
    fill_in "Cod 8", with: @source_france.cod_8
    fill_in "Cod 9", with: @source_france.cod_9
    fill_in "Isin", with: @source_france.isin
    fill_in "Name", with: @source_france.name
    fill_in "Url 0", with: @source_france.url_0
    fill_in "Url 1", with: @source_france.url_1
    fill_in "Url 10", with: @source_france.url_10
    fill_in "Url 11", with: @source_france.url_11
    fill_in "Url 2", with: @source_france.url_2
    fill_in "Url 3", with: @source_france.url_3
    fill_in "Url 4", with: @source_france.url_4
    fill_in "Url 5", with: @source_france.url_5
    fill_in "Url 6", with: @source_france.url_6
    fill_in "Url 7", with: @source_france.url_7
    fill_in "Url 8", with: @source_france.url_8
    fill_in "Url 9", with: @source_france.url_9
    click_on "Update Source france"

    assert_text "Source france was successfully updated"
    click_on "Back"
  end

  test "destroying a Source france" do
    visit source_frances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Source france was successfully destroyed"
  end
end
