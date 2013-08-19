require 'spec_helper'

# size
# data_type
# label

describe Element do

  context "#new" do
    it "should allow mass-assignment on label" do
      expect{ element = Element.new(label: "Name") }.not_to raise_error
    end

    it "should allow mass-assignment on data_type" do
      expect{ element = Element.new(data_type: "String") }.not_to raise_error
    end

    it "should allow mass-assignment on size" do
      expect{ element = Element.new(size: "2") }.not_to raise_error
    end

    it { should respond_to(:label) }
    it { should respond_to(:data_type) }
    it { should respond_to(:size) }
  end

  context "#save" do
    it "requires a valid label" do
      element = Element.new(data_type: "String")
      expect(element).not_to be_valid
    end

    it "requires a valid data_type" do
      element = Element.new(label: "Name")
      expect(element).not_to be_valid
    end

    it "does not requires a size" do
      element = Element.new(label: "Name", data_type: "String")
      expect(element).to be_valid
    end
  end
end
