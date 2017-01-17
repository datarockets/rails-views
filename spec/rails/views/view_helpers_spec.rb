require 'spec_helper'

class SomeView < Rails::View
  options :test
end

describe SomeView do
  let(:model) { double }
  let(:test_option) { 'value' }
  subject { described_class.new(model, test: test_option) }

  describe 'option' do
    its(:test) { is_expected.to eq test_option }
  end
end
