require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }
  describe "#push" do
    subject { stack.push 1 }
    it { expect(subject).to eq stack }
  end

  describe "#pop" do
    subject { stack.pop }
    context "空のstack" do
      it { expect(subject).to be_nil }
      it { expect{subject}.not_to change{stack.length} }
    end

    context "1をpush済みのstack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
      it { expect{subject}.to change{stack.length}.from(1).to(0) }
    end

    context "1と5をpush済みのstack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 5 }
      it { expect{subject}.to change{stack.length}.from(2).to(1) }
    end
  end

  describe "#length" do
    subject { stack.length }
    context "1をpush済みのstack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
    end

    context "1と5をpush済みのstack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 2 }
    end
  end

  describe "#empty?" do
    subject { stack.empty? }
    context "空のstack" do
      it { expect(subject).to be_truthy }
    end

    context "push済みのstack" do
      before { stack.push 1 }
      it { expect(subject).to be_falsey }
    end
  end
end
