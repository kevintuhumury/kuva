require "spec_helper"
require "generators/kuva/install_generator"

module Kuva
  module Generators
    describe InstallGenerator do
      destination File.expand_path("../../../../tmp", __FILE__)

      let(:initializer) { file("config/initializers/kuva.rb") }
      let(:locale)      { file("config/locales/kuva.en.yml") }
      let(:routes)      { file("config/routes.rb") }

      before do
        prepare_destination
        prepare_config_routes
      end

      it "generates config/initializers/kuva.rb" do
        expect { generator.invoke :copy_initializer }.to output(/.*/).to_stdout
        expect(initializer).to exist
      end

      it "generates config/locales/kuva.en.yml" do
        expect { generator.invoke :copy_locale }.to output(/.*/).to_stdout
        expect(locale).to exist
      end

      it "generates assets" do
        expect_any_instance_of(described_class).to receive(:generate).with "kuva:assets"
        generator.invoke :create_assets
      end

      context "mounting of the Kuva engine" do
        context "when it has been mounted" do
          before { allow_any_instance_of(described_class).to receive_message_chain(:original_routes, :include?).and_return true }

          it "outputs a status message" do
            expect_any_instance_of(described_class).to receive(:say_status).with "skip", "mounting of Kuva into config/routes.rb", :yellow
            generator.invoke :mount_engine
          end
        end

        context "when it hasn't been mounted" do
          it "mounts the Kuva engine" do
            expect { generator.invoke :mount_engine }.to output(/.*/).to_stdout
            expect(routes).to contain 'mount Kuva::Engine => "/kuva"'
          end
        end
      end

      after do
        FileUtils.rm_rf destination_root
      end

      def prepare_config_routes
        FileUtils.mkdir "#{destination_root}/config"
        File.open("#{destination_root}/config/routes.rb", "w+") do |file|
          file.write "Rails.application.routes.draw do\nend"
        end
      end
    end
  end
end
