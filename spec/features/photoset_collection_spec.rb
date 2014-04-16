require "spec_helper"

feature "photoset collection", :vcr do

  background { visit kuva.root_path }

  scenario "viewing the photoset collection" do
    expect(page).to have_selector "h1", text: "Photosets"
    expect(page).to have_selector "ul.photosets li a img", count: 40
    expect(page).not_to have_selector "ul.breadcrumbs"
  end

  scenario "navigating to the page with photos of the first photoset" do
    expect(page).to have_selector "h1", text: "Photosets"

    within "ul.photosets li:first" do
      expect(page).to have_content "Paris"
      find(:xpath, ".//a/img[@alt='Paris']/..").click
    end

    expect(page).to have_selector "h1", text: "Paris"
    expect(page).to have_selector ".photos a img", count: 28
  end

end
