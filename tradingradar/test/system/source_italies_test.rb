require "application_system_test_case"

class SourceItaliesTest < ApplicationSystemTestCase
  setup do
    @source_italy = source_italies(:one)
  end

  test "visiting the index" do
    visit source_italies_url
    assert_selector "h1", text: "Source Italies"
  end

  test "creating a Source italy" do
    visit source_italies_url
    click_on "New Source Italy"

    fill_in "Cod 0", with: @source_italy.cod_0
    fill_in "Cod 1", with: @source_italy.cod_1
    fill_in "Cod 10", with: @source_italy.cod_10
    fill_in "Cod 11", with: @source_italy.cod_11
    fill_in "Cod 2", with: @source_italy.cod_2
    fill_in "Cod 3", with: @source_italy.cod_3
    fill_in "Cod 4", with: @source_italy.cod_4
    fill_in "Cod 5", with: @source_italy.cod_5
    fill_in "Cod 6", with: @source_italy.cod_6
    fill_in "Cod 7", with: @source_italy.cod_7
    fill_in "Cod 8", with: @source_italy.cod_8
    fill_in "Cod 9", with: @source_italy.cod_9
    fill_in "Isin", with: @source_italy.isin
    fill_in "Name", with: @source_italy.name
    fill_in "Url 0", with: @source_italy.url_0
    fill_in "Url 1", with: @source_italy.url_1
    fill_in "Url 10", with: @source_italy.url_10
    fill_in "Url 11", with: @source_italy.url_11
    fill_in "Url 2", with: @source_italy.url_2
    fill_in "Url 3", with: @source_italy.url_3
    fill_in "Url 4", with: @source_italy.url_4
    fill_in "Url 5", with: @source_italy.url_5
    fill_in "Url 6", with: @source_italy.url_6
    fill_in "Url 7", with: @source_italy.url_7
    fill_in "Url 8", with: @source_italy.url_8
    fill_in "Url 9", with: @source_italy.url_9
    click_on "Create Source italy"

    assert_text "Source italy was successfully created"
    click_on "Back"
  end

  test "updating a Source italy" do
    visit source_italies_url
    click_on "Edit", match: :first

    fill_in "Cod 0", with: @source_italy.cod_0
    fill_in "Cod 1", with: @source_italy.cod_1
    fill_in "Cod 10", with: @source_italy.cod_10
    fill_in "Cod 11", with: @source_italy.cod_11
    fill_in "Cod 2", with: @source_italy.cod_2
    fill_in "Cod 3", with: @source_italy.cod_3
    fill_in "Cod 4", with: @source_italy.cod_4
    fill_in "Cod 5", with: @source_italy.cod_5
    fill_in "Cod 6", with: @source_italy.cod_6
    fill_in "Cod 7", with: @source_italy.cod_7
    fill_in "Cod 8", with: @source_italy.cod_8
    fill_in "Cod 9", with: @source_italy.cod_9
    fill_in "Isin", with: @source_italy.isin
    fill_in "Name", with: @source_italy.name
    fill_in "Url 0", with: @source_italy.url_0
    fill_in "Url 1", with: @source_italy.url_1
    fill_in "Url 10", with: @source_italy.url_10
    fill_in "Url 11", with: @source_italy.url_11
    fill_in "Url 2", with: @source_italy.url_2
    fill_in "Url 3", with: @source_italy.url_3
    fill_in "Url 4", with: @source_italy.url_4
    fill_in "Url 5", with: @source_italy.url_5
    fill_in "Url 6", with: @source_italy.url_6
    fill_in "Url 7", with: @source_italy.url_7
    fill_in "Url 8", with: @source_italy.url_8
    fill_in "Url 9", with: @source_italy.url_9
    click_on "Update Source italy"

    assert_text "Source italy was successfully updated"
    click_on "Back"
  end

  test "destroying a Source italy" do
    visit source_italies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Source italy was successfully destroyed"
  end
end
