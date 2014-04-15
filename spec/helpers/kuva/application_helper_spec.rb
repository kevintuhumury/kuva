require "spec_helper"

describe Kuva::ApplicationHelper, :vcr do

  describe "#breadcrumbs_for" do
    let(:photoset_id) { "72157632367381040" }
    let(:photoset)    { Kuva::Elements::Photoset.find photoset_id }

    subject { helper.breadcrumbs_for photoset }

    context "when the current page is the set page" do
      before { allow(helper).to receive(:current_page?).and_return true }

      it "creates a breadcrumb without the set URL" do
        expect(subject).to eq '<ul class="breadcrumbs"><li><a href="http://test.host/kuva/">Photosets</a></li></ul>'
      end
    end

    context "when the current page is NOT the set page" do
      it "creates a breadcrumb with the set URL" do
        expect(subject).to eq '<ul class="breadcrumbs"><li><a href="http://test.host/kuva/">Photosets</a></li><li><a href="http://test.host/kuva/sets/72157632367381040">Paris</a></li></ul>'
      end
    end
  end

end
