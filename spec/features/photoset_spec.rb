require "spec_helper"

feature "photoset", :vcr do

  let(:photoset_id) { "72157632367381040" }

  background { visit kuva.set_path(id: photoset_id) }

  scenario "viewing the first photoset of the photoset collection" do
    within "ul.breadcrumbs" do
      expect(page).to have_selector "li", text: "Photosets"
      expect(page).not_to have_selector "li", text: "Paris"
    end

    expect(page).to have_selector "h1", text: "Paris"
    expect(page).to have_selector ".photos a img", count: 28
  end

  scenario "navigating back to the photoset collection page" do
    expect(page).to have_selector "h1", text: "Paris"

    within "ul.breadcrumbs" do
      click_link "Photosets"
    end

    expect(page).to have_selector "h1", text: "Photosets"
    expect(page).not_to have_selector "h1", text: "Paris"
    expect(page).not_to have_selector "ul.breadcrumbs"
  end

  scenario "navigating to the page with details of the first photo" do
    expect(page).to have_selector "h1", text: "Paris"

    within ".photos" do
      expect(page).to have_link "Top of the Eiffel Tower"
      click_link "Top of the Eiffel Tower"
    end

    expect(page).to have_selector "h1", text: "Top of the Eiffel Tower"
    expect(page).not_to have_selector "h1", text: "Paris"
  end
end
