require "application_system_test_case"

class AnalysesTest < ApplicationSystemTestCase
  setup do
    @analysis = analyses(:one)
  end

  test "visiting the index" do
    visit analyses_url
    assert_selector "h1", text: "Analyses"
  end

  test "creating a Analysis" do
    visit analyses_url
    click_on "New Analysis"

    fill_in "Author", with: @analysis.author
    fill_in "Body", with: @analysis.body
    fill_in "Description", with: @analysis.description
    fill_in "Isin", with: @analysis.isin
    fill_in "Reuters", with: @analysis.reuters
    fill_in "Slug", with: @analysis.slug
    fill_in "Stock", with: @analysis.stock
    fill_in "Title", with: @analysis.title
    click_on "Create Analysis"

    assert_text "Analysis was successfully created"
    click_on "Back"
  end

  test "updating a Analysis" do
    visit analyses_url
    click_on "Edit", match: :first

    fill_in "Author", with: @analysis.author
    fill_in "Body", with: @analysis.body
    fill_in "Description", with: @analysis.description
    fill_in "Isin", with: @analysis.isin
    fill_in "Reuters", with: @analysis.reuters
    fill_in "Slug", with: @analysis.slug
    fill_in "Stock", with: @analysis.stock
    fill_in "Title", with: @analysis.title
    click_on "Update Analysis"

    assert_text "Analysis was successfully updated"
    click_on "Back"
  end

  test "destroying a Analysis" do
    visit analyses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Analysis was successfully destroyed"
  end
end
