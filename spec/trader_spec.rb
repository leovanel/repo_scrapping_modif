require_relative '../lib/trader'

describe "the scrapping_values method" do
    it "should return tab, and tab is not nil" do
      expect(scrapping_values).not_to be_nil
    end
    it "should return an array" do
        expect(scrapping_values).to be_instance_of Array 
      end
  
    
  end


  