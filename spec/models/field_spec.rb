require 'spec_helper'

describe Field do

  context "#new" do
    it "should allow mass-assignment on default_label" do
      expect{ field = Field.new(default_label: "Name") }.not_to raise_error
    end

    it "should allow mass-assignment on data_type" do
      expect{ field = Field.new(data_type: "String") }.not_to raise_error
    end

    it { should respond_to(:default_label) }
    it { should respond_to(:data_type) }
  end

  context "#save" do
    it "requires a default_label" do
      field = Field.new(data_type: "string")
      expect(field).not_to be_valid
    end

    it "requires a data_type" do
      field = Field.new(default_label: "label")
      expect(field).not_to be_valid
    end
  end
end
