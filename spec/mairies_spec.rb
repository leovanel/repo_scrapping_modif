require_relative '../lib/mairies'

describe "the scrap_mairie method" do
    it "should return tab_final, and tab_final is not nil" do
      expect(scrap_mairie).not_to be_nil
    end
    it "should return an array" do
        expect(scrap_mairie).to be_instance_of Array end
  end