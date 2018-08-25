require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }
  describe "#push" do
    subject { stack.push }
    it { expect(subject).to eq stack }
  end
end
