require 'spec_helper'

class SomeView < Rails::View
  option :test
end

describe SomeView do
  let(:model) { double }
  let(:test_option) { 'value' }

  subject { described_class.new(model, test: test_option) }

  describe 'option' do
    it(:test) { expect(subject.test).to eq test_option }
  end
end
