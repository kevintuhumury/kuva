require "spec_helper"

feature "photoset", :vcr do

  let(:photoset_id) { "72157632367381040" }

  background { visit kuva.set_path(id: photoset_id) }

  scenario "viewing the first photoset of the photoset collection" do
    expect(page).to have_selector "h1", text: "Paris"
    expect(page).to have_selector ".photos a img", count: 28
  end

  scenario "navigating to the page with details of the first photo" do
    expect(page).to have_selector "h1", text: "Paris"

    within ".photos" do
      expect(page).to have_link "Top of the Eiffel Tower"
      click_link "Top of the Eiffel Tower"
    end

    expect(page).to have_selector "h1", text: "Top of the Eiffel Tower"
  end
end
