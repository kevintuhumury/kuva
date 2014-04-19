require "spec_helper"
require "generators/kuva/install_generator"

module Kuva
  module Generators
    describe InstallGenerator do
      destination File.expand_path("../../../../tmp", __FILE__)

      let(:initializer) { file("config/initializers/kuva.rb") }
      let(:locale)      { file("config/locales/kuva.en.yml") }

      before { prepare_destination }

      it "generates config/initializers/kuva.rb" do
        capture(:stdout) { generator.invoke :copy_initializer }
        expect(initializer).to exist
      end

      it "generates config/locales/kuva.en.yml" do
        capture(:stdout) { generator.invoke :copy_locale }
        expect(locale).to exist
      end

      it "generates assets" do
        expect_any_instance_of(described_class).to receive(:generate).with "kuva:assets"
        generator.invoke :create_assets
      end

      after do
        FileUtils.rm_rf File.expand_path("../../../../tmp", __FILE__)
      end
    end
  end
end
