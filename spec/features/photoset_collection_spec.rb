require "spec_helper"

feature "photoset collection", :vcr do

  background { visit kuva.root_path }

  scenario "viewing the photoset collection" do
    expect(page).to have_selector "h1", text: "Photosets"
    expect(page).to have_selector "ul.photosets li a img", count: 40
  end

  scenario "navigating to the page with photos of the first photoset" do
    expect(page).to have_selector "h1", text: "Photosets"

    within "ul.photosets li:first" do
      expect(page).to have_link "Paris"
      click_link "Paris"
    end

    expect(page).to have_selector "h1", text: "Paris"
    expect(page).to have_selector ".photos a img", count: 28
  end

end
