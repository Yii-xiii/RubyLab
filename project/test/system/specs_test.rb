require "application_system_test_case"

class SpecsTest < ApplicationSystemTestCase
  setup do
    @spec = specs(:one)
  end

  test "visiting the index" do
    visit specs_url
    assert_selector "h1", text: "Specs"
  end

  test "creating a Spec" do
    visit specs_url
    click_on "New Spec"

    fill_in "Product", with: @spec.product
    fill_in "Title", with: @spec.title
    click_on "Create Spec"

    assert_text "Spec was successfully created"
    click_on "Back"
  end

  test "updating a Spec" do
    visit specs_url
    click_on "Edit", match: :first

    fill_in "Product", with: @spec.product
    fill_in "Title", with: @spec.title
    click_on "Update Spec"

    assert_text "Spec was successfully updated"
    click_on "Back"
  end

  test "destroying a Spec" do
    visit specs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spec was successfully destroyed"
  end
end
