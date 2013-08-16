require 'spec_helper'

describe Form do

  let(:provider) { Provider.new }

  context "#new" do
    it "should allow mass-assignment on name" do
      expect{ form = Form.new(name: "Disclosure Agreement") }.not_to raise_error
    end

    it { should respond_to(:name) }
    it { should respond_to(:provider_id) }
  end

  context "#save" do
    it "requires a valid name" do
      form = provider.users.new
      expect(form).not_to be_valid
    end

    it "requires a valid provider" do
      form = Form.new(name: "Disclosure Agreement")
      expect(form).not_to be_valid
    end
  end
end
