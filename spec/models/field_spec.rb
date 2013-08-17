require 'spec_helper'

describe Field do

  context "#new" do
    it "should allow mass-assignment on label" do
      expect{ field = Field.new(label: "Name") }.not_to raise_error
    end

    it "should allow mass-assignment on brand" do
      expect{ field = Field.new(brand: "String") }.not_to raise_error
    end

    it { should respond_to(:label) }
    it { should respond_to(:brand) }
  end

  context "#save" do
    it "requires a label" do
      field = Field.new(brand: "string")
      expect(field).not_to be_valid
    end

    it "requires a brand" do
      field = Field.new(label: "label")
      expect(field).not_to be_valid
    end
  end
end
