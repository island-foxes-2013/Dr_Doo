require 'spec_helper'

describe Field do

  let(:element) { FactoryGirl.build(:element) }
  let(:form) { FactoryGirl.build(:form) }

  context "#new" do
    it "should allow mass-assignment on label" do
      expect{ field = Field.new(label: "Name") }.not_to raise_error
    end

    it "should allow mass-assignment on element_id" do
      expect{ field = Field.new(element_id: 1) }.not_to raise_error
      expect{ field = Field.new(element_id: element) }.not_to raise_error
    end

    it "should not allow mass-assignment on form_id" do
      expect{ field = Field.new(form_id: 1) }.to raise_error
      expect{ field = Field.new(form_id: form) }.to raise_error
    end

    it { should respond_to(:label) }
    it { should respond_to(:form_id) }
    it { should respond_to(:element_id) }
  end

  context "#save" do
    it "requires a valid label" do
      field = form.fields.new(element_id: 1)
      expect(field).not_to be_valid
    end

    it "requires a valid form_id" do
      field = Field.new(label: "Name", element_id: 1)
      expect(field).not_to be_valid
    end

    it "requires a valid element_id" do
      field = form.fields.new(label: "Name")
      expect(field).not_to be_valid
    end
  end
end
