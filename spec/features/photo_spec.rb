require "spec_helper"

feature "photoset", :vcr do

  let(:photoset_id) { "72157632367381040" }
  let(:photo_id)    { "8318972536" }

  background { visit kuva.set_photo_path(set_id: photoset_id, id: photo_id) }

  scenario "viewing the first photo of the photoset" do
    expect(page).to have_selector "h1", text: "Top of the Eiffel Tower"
    expect(page).to have_selector "p", text: "These shots were taken in Paris, France in December 2012. Most of them are taken with my Nikon D80 and Nikkor 50mm f/1.8 or Tokina 12-24mm f/4."
    expect(page).to have_selector "img", count: 1
  end

end
