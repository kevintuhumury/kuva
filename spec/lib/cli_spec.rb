require "spec_helper"

module Kuva
  describe CLI do

    it "authorizes" do
      allow(Authorizer).to receive :authorize
      subject.authorize
    end

  end
end
