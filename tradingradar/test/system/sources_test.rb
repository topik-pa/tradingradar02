require "application_system_test_case"

class SourcesTest < ApplicationSystemTestCase
  setup do
    @source = sources(:one)
  end

  test "visiting the index" do
    visit sources_url
    assert_selector "h1", text: "Sources"
  end

  test "creating a Source" do
    visit sources_url
    click_on "New Source"

    fill_in "Cod 0", with: @source.cod_0
    fill_in "Cod 1", with: @source.cod_1
    fill_in "Cod 10", with: @source.cod_10
    fill_in "Cod 11", with: @source.cod_11
    fill_in "Cod 12", with: @source.cod_12
    fill_in "Cod 13", with: @source.cod_13
    fill_in "Cod 14", with: @source.cod_14
    fill_in "Cod 15", with: @source.cod_15
    fill_in "Cod 16", with: @source.cod_16
    fill_in "Cod 17", with: @source.cod_17
    fill_in "Cod 18", with: @source.cod_18
    fill_in "Cod 19", with: @source.cod_19
    fill_in "Cod 2", with: @source.cod_2
    fill_in "Cod 3", with: @source.cod_3
    fill_in "Cod 4", with: @source.cod_4
    fill_in "Cod 5", with: @source.cod_5
    fill_in "Cod 6", with: @source.cod_6
    fill_in "Cod 7", with: @source.cod_7
    fill_in "Cod 8", with: @source.cod_8
    fill_in "Cod 9", with: @source.cod_9
    fill_in "Isin", with: @source.isin
    fill_in "Name 0", with: @source.name_0
    fill_in "Name 1", with: @source.name_1
    fill_in "Name 10", with: @source.name_10
    fill_in "Name 11", with: @source.name_11
    fill_in "Name 12", with: @source.name_12
    fill_in "Name 13", with: @source.name_13
    fill_in "Name 14", with: @source.name_14
    fill_in "Name 15", with: @source.name_15
    fill_in "Name 16", with: @source.name_16
    fill_in "Name 17", with: @source.name_17
    fill_in "Name 18", with: @source.name_18
    fill_in "Name 19", with: @source.name_19
    fill_in "Name 2", with: @source.name_2
    fill_in "Name 3", with: @source.name_3
    fill_in "Name 4", with: @source.name_4
    fill_in "Name 5", with: @source.name_5
    fill_in "Name 6", with: @source.name_6
    fill_in "Name 7", with: @source.name_7
    fill_in "Name 8", with: @source.name_8
    fill_in "Name 9", with: @source.name_9
    fill_in "Stock", with: @source.stock
    fill_in "Url 0", with: @source.url_0
    fill_in "Url 1", with: @source.url_1
    fill_in "Url 10", with: @source.url_10
    fill_in "Url 11", with: @source.url_11
    fill_in "Url 12", with: @source.url_12
    fill_in "Url 13", with: @source.url_13
    fill_in "Url 14", with: @source.url_14
    fill_in "Url 15", with: @source.url_15
    fill_in "Url 16", with: @source.url_16
    fill_in "Url 17", with: @source.url_17
    fill_in "Url 18", with: @source.url_18
    fill_in "Url 19", with: @source.url_19
    fill_in "Url 2", with: @source.url_2
    fill_in "Url 3", with: @source.url_3
    fill_in "Url 4", with: @source.url_4
    fill_in "Url 5", with: @source.url_5
    fill_in "Url 6", with: @source.url_6
    fill_in "Url 7", with: @source.url_7
    fill_in "Url 8", with: @source.url_8
    fill_in "Url 9", with: @source.url_9
    click_on "Create Source"

    assert_text "Source was successfully created"
    click_on "Back"
  end

  test "updating a Source" do
    visit sources_url
    click_on "Edit", match: :first

    fill_in "Cod 0", with: @source.cod_0
    fill_in "Cod 1", with: @source.cod_1
    fill_in "Cod 10", with: @source.cod_10
    fill_in "Cod 11", with: @source.cod_11
    fill_in "Cod 12", with: @source.cod_12
    fill_in "Cod 13", with: @source.cod_13
    fill_in "Cod 14", with: @source.cod_14
    fill_in "Cod 15", with: @source.cod_15
    fill_in "Cod 16", with: @source.cod_16
    fill_in "Cod 17", with: @source.cod_17
    fill_in "Cod 18", with: @source.cod_18
    fill_in "Cod 19", with: @source.cod_19
    fill_in "Cod 2", with: @source.cod_2
    fill_in "Cod 3", with: @source.cod_3
    fill_in "Cod 4", with: @source.cod_4
    fill_in "Cod 5", with: @source.cod_5
    fill_in "Cod 6", with: @source.cod_6
    fill_in "Cod 7", with: @source.cod_7
    fill_in "Cod 8", with: @source.cod_8
    fill_in "Cod 9", with: @source.cod_9
    fill_in "Isin", with: @source.isin
    fill_in "Name 0", with: @source.name_0
    fill_in "Name 1", with: @source.name_1
    fill_in "Name 10", with: @source.name_10
    fill_in "Name 11", with: @source.name_11
    fill_in "Name 12", with: @source.name_12
    fill_in "Name 13", with: @source.name_13
    fill_in "Name 14", with: @source.name_14
    fill_in "Name 15", with: @source.name_15
    fill_in "Name 16", with: @source.name_16
    fill_in "Name 17", with: @source.name_17
    fill_in "Name 18", with: @source.name_18
    fill_in "Name 19", with: @source.name_19
    fill_in "Name 2", with: @source.name_2
    fill_in "Name 3", with: @source.name_3
    fill_in "Name 4", with: @source.name_4
    fill_in "Name 5", with: @source.name_5
    fill_in "Name 6", with: @source.name_6
    fill_in "Name 7", with: @source.name_7
    fill_in "Name 8", with: @source.name_8
    fill_in "Name 9", with: @source.name_9
    fill_in "Stock", with: @source.stock
    fill_in "Url 0", with: @source.url_0
    fill_in "Url 1", with: @source.url_1
    fill_in "Url 10", with: @source.url_10
    fill_in "Url 11", with: @source.url_11
    fill_in "Url 12", with: @source.url_12
    fill_in "Url 13", with: @source.url_13
    fill_in "Url 14", with: @source.url_14
    fill_in "Url 15", with: @source.url_15
    fill_in "Url 16", with: @source.url_16
    fill_in "Url 17", with: @source.url_17
    fill_in "Url 18", with: @source.url_18
    fill_in "Url 19", with: @source.url_19
    fill_in "Url 2", with: @source.url_2
    fill_in "Url 3", with: @source.url_3
    fill_in "Url 4", with: @source.url_4
    fill_in "Url 5", with: @source.url_5
    fill_in "Url 6", with: @source.url_6
    fill_in "Url 7", with: @source.url_7
    fill_in "Url 8", with: @source.url_8
    fill_in "Url 9", with: @source.url_9
    click_on "Update Source"

    assert_text "Source was successfully updated"
    click_on "Back"
  end

  test "destroying a Source" do
    visit sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Source was successfully destroyed"
  end
end
